"""Structured test-case input/output formatting for problem JSON seeds."""

from __future__ import annotations

import json
import re
from typing import Any

DEFAULT_SINGLE_PARAM_KEY = "input"


def clean_expected_output(value: str) -> str:
    text = value.strip()
    text = re.split(r"(?:\*\*)?解释[：:]", text, maxsplit=1)[0].strip()
    text = re.split(r"(?:\*\*)?示例\s*\d+[：:]", text, maxsplit=1)[0].strip()
    return text


def extract_example_input_texts(description_md: str) -> list[str]:
    texts: list[str] = []
    patterns = [
        re.compile(
            r"\*\*输入[：:]?\*\*\s*(.*?)\s*\*\*输出[：:]?\*\*",
            re.S,
        ),
        re.compile(
            r"\*\*输入[：:]?\*\*\s*(.*?)\s*\*\*输出[：:]?\s*\*\*",
            re.S,
        ),
        re.compile(
            r"(?<!\*)\b输入[：:]\s*(.*?)\s*输出[：:]",
            re.S,
        ),
    ]
    for pattern in patterns:
        for match in pattern.finditer(description_md or ""):
            text = match.group(1).strip()
            if text:
                texts.append(text)
        if texts:
            break
    return texts


def example_input_has_named_key(text: str) -> bool:
    return bool(re.search(r"\b\w+\s*=", text))


def resolve_single_param_key(
    meta_data: dict,
    description_md: str,
    case_index: int,
    legacy_text: str = "",
) -> str:
    params = meta_data.get("params") or []
    if not params:
        return DEFAULT_SINGLE_PARAM_KEY

    param_name = params[0]["name"]
    examples = extract_example_input_texts(description_md)
    if case_index < len(examples):
        if example_input_has_named_key(examples[case_index]):
            return param_name
        return DEFAULT_SINGLE_PARAM_KEY

    if legacy_text and example_input_has_named_key(legacy_text):
        return param_name
    return DEFAULT_SINGLE_PARAM_KEY


def resolve_param_keys(
    meta_data: dict,
    description_md: str,
    case_index: int = 0,
    legacy_text: str = "",
) -> list[str] | None:
    """Return param keys for function problems, or None for system-design."""
    if meta_data.get("systemdesign"):
        return None

    params = meta_data.get("params") or []
    if len(params) > 1:
        return [p["name"] for p in params]
    if len(params) == 1:
        return [resolve_single_param_key(meta_data, description_md, case_index, legacy_text)]
    return [DEFAULT_SINGLE_PARAM_KEY]


def parse_json_value(raw: str) -> Any:
    text = raw.strip()
    if not text:
        return text

    try:
        return json.loads(text)
    except json.JSONDecodeError:
        pass

    lowered = text.lower()
    if lowered == "true":
        return True
    if lowered == "false":
        return False
    if lowered == "null":
        return None

    try:
        if re.fullmatch(r"-?\d+", text):
            return int(text)
    except ValueError:
        pass

    try:
        if re.fullmatch(r"-?\d+\.\d+", text):
            return float(text)
    except ValueError:
        pass

    if (text.startswith('"') and text.endswith('"')) or (
        text.startswith("'") and text.endswith("'")
    ):
        try:
            return json.loads(text)
        except json.JSONDecodeError:
            return text[1:-1]

    return text


def split_legacy_input_lines(raw_input: str) -> list[str]:
    return [part.strip() for part in raw_input.split("\n") if part.strip()]


def parse_named_input_text(text: str) -> dict[str, Any]:
    """Parse `a = 1, b = [2,3]` style input into a dict."""
    result: dict[str, Any] = {}
    for part in re.split(r",(?=(?:[^\"\'\[\]]|[\"\'\[][^\"\'\]]*[\"\'\]])*$)", text):
        part = part.strip()
        if not part or "=" not in part:
            continue
        name, value = part.split("=", 1)
        result[name.strip()] = parse_json_value(value.strip())
    return result


def rekey_structured_input(
    structured: dict[str, Any],
    meta_data: dict,
    description_md: str,
    case_index: int,
) -> dict[str, Any]:
    if meta_data.get("systemdesign"):
        return structured

    params = meta_data.get("params") or []
    if len(params) != 1 or len(structured) != 1:
        return structured

    key = resolve_single_param_key(meta_data, description_md, case_index)
    value = next(iter(structured.values()))
    return {key: value}


def build_structured_input(
    raw_input: str | dict[str, Any],
    meta_data: dict,
    description_md: str,
    case_index: int = 0,
) -> dict[str, Any]:
    if isinstance(raw_input, dict):
        return rekey_structured_input(raw_input, meta_data, description_md, case_index)

    text = (raw_input or "").strip()
    if meta_data.get("systemdesign"):
        parts = split_legacy_input_lines(text)
        if len(parts) < 2:
            raise ValueError(f"systemdesign input needs 2 lines, got: {text!r}")
        return {
            "operations": parse_json_value(parts[0]),
            "arguments": parse_json_value(parts[1]),
        }

    keys = resolve_param_keys(meta_data, description_md, case_index, text)
    assert keys is not None

    if len(keys) == 1:
        parts = split_legacy_input_lines(text)
        value_raw = parts[0] if parts else text
        if example_input_has_named_key(value_raw):
            named = parse_named_input_text(value_raw.replace("\n", ", "))
            if len(named) == 1:
                return named
            if keys[0] in named:
                return {keys[0]: named[keys[0]]}
        return {keys[0]: parse_json_value(value_raw)}

    if "\n" not in text and "=" in text:
        named = parse_named_input_text(text.replace("\n", ", "))
        if named:
            if set(named.keys()) == set(keys):
                return {key: named[key] for key in keys}
            filled = dict(named)
            for part in re.split(
                r",(?=(?:[^\"\'\[\]]|[\"\'\[][^\"\'\]]*[\"\'\]])*$)", text
            ):
                part = part.strip()
                if "=" in part:
                    continue
                for key in keys:
                    if key not in filled:
                        filled[key] = parse_json_value(part)
                        break
            if set(filled.keys()) == set(keys):
                return {key: filled[key] for key in keys}

    parts = split_legacy_input_lines(text)
    if len(parts) != len(keys):
        raise ValueError(
            f"expected {len(keys)} input lines ({keys}), got {len(parts)}: {text!r}"
        )
    return {key: parse_json_value(part) for key, part in zip(keys, parts)}


def build_structured_output(raw_output: Any, meta_data: dict | None = None) -> Any:
    del meta_data
    if isinstance(raw_output, (dict, list, bool, int, float)) or raw_output is None:
        return raw_output
    if not isinstance(raw_output, str):
        return raw_output
    cleaned = clean_expected_output(raw_output)
    return parse_json_value(cleaned)


def normalize_test_case(
    case: dict,
    meta_data: dict,
    description_md: str,
    case_index: int,
) -> dict:
    return {
        "sort_order": case["sort_order"],
        "is_sample": case.get("is_sample", True),
        "input": build_structured_input(
            case["input"], meta_data, description_md, case_index
        ),
        "expected_output": build_structured_output(
            case.get("expected_output"), meta_data
        ),
    }


def normalize_problem_test_cases(problem: dict) -> dict:
    meta_data = problem.get("meta_data") or {}
    description_md = problem.get("description_md") or ""
    cases = problem.get("sample_test_cases") or []
    problem["sample_test_cases"] = [
        normalize_test_case(case, meta_data, description_md, index)
        for index, case in enumerate(cases)
    ]
    return problem
