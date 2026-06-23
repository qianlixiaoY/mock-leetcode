#!/usr/bin/env python3
"""Convert problem JSON files into INSERT IGNORE SQL seed statements."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

TEMPLATE_LANGS = ("JAVA", "JAVASCRIPT", "PYTHON", "TYPESCRIPT")


def sql_string(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def sql_json_value(value) -> str:
    return sql_string(json.dumps(value, ensure_ascii=False))


def load_existing_slugs(data_sql: Path) -> set[str]:
    if not data_sql.exists():
        return set()
    text = data_sql.read_text(encoding="utf-8")
    return set(
        re.findall(r"'([a-z0-9-]+)',\s*\r?\n\s*'(?:EASY|MEDIUM|HARD)'", text)
    )


def render_problem(problem: dict) -> str:
    lines = [
        "INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb)",
        "VALUES (",
        f"    {problem['id']},",
        f"    {sql_string(problem['title'])},",
        f"    {sql_string(problem['slug'])},",
        f"    {sql_string(problem['difficulty'])},",
        f"    {sql_string(problem['description_md'])},",
        f"    {problem.get('time_limit_ms', 2000)},",
        f"    {problem.get('memory_limit_mb', 256)}",
        ");",
        "",
    ]
    return "\n".join(lines)


def render_templates(problem: dict) -> str:
    snippets = problem.get("code_snippets") or {}
    rows = []
    for lang in TEMPLATE_LANGS:
        code = snippets.get(lang)
        if not code:
            continue
        rows.append(f"({problem['id']}, {sql_string(lang)}, {sql_string(code)})")

    if not rows:
        return ""

    lines = [
        "INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES",
        ",\n".join(rows) + ";",
        "",
    ]
    return "\n".join(lines)


def render_test_cases(problem: dict) -> str:
    cases = problem.get("sample_test_cases") or []
    if not cases:
        return ""

    rows = []
    for case in cases:
        is_sample = "TRUE" if case.get("is_sample", True) else "FALSE"
        input_value = case["input"]
        output_value = case["expected_output"]
        if not isinstance(input_value, str):
            input_value = json.dumps(input_value, ensure_ascii=False)
        if not isinstance(output_value, str):
            output_value = json.dumps(output_value, ensure_ascii=False)
        rows.append(
            f"({problem['id']}, {sql_string(input_value)}, "
            f"{sql_string(output_value)}, {is_sample}, {case['sort_order']})"
        )

    lines = [
        "INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES",
        ",\n".join(rows) + ";",
        "",
    ]
    return "\n".join(lines)


def render_problem_sql(problem: dict) -> str:
    parts = [
        render_problem(problem),
        render_templates(problem),
        render_test_cases(problem),
    ]
    return "\n".join(p for p in parts if p)


def main() -> int:
    parser = argparse.ArgumentParser(description="Convert problem JSON files to SQL.")
    parser.add_argument(
        "--input",
        type=Path,
        default=Path("data/problems"),
        help="Directory containing *.json problem files",
    )
    parser.add_argument(
        "--data-sql",
        type=Path,
        default=Path("backend/oj-api/src/main/resources/data.sql"),
        help="Existing data.sql to append to",
    )
    parser.add_argument(
        "--exclude-slug",
        action="append",
        default=[],
        help="Skip these slugs (can repeat)",
    )
    parser.add_argument(
        "--rewrite",
        action="store_true",
        help="Replace data.sql instead of appending",
    )
    parser.add_argument(
        "--prefix-file",
        type=Path,
        help="Optional SQL file to prepend when using --rewrite",
    )
    args = parser.parse_args()

    exclude = set(args.exclude_slug)
    if not args.rewrite:
        exclude |= load_existing_slugs(args.data_sql)

    json_files = sorted(args.input.glob("*.json"))
    if not json_files:
        print(f"no JSON files in {args.input}", file=sys.stderr)
        return 1

    blocks: list[str] = []
    skipped = 0
    for path in json_files:
        problem = json.loads(path.read_text(encoding="utf-8"))
        slug = problem.get("slug") or path.stem
        if slug in exclude:
            skipped += 1
            continue
        blocks.append(render_problem_sql(problem))

    if not blocks:
        print(f"nothing to write (skipped={skipped})")
        return 0

    if args.rewrite:
        parts: list[str] = []
        if args.prefix_file:
            parts.append(args.prefix_file.read_text(encoding="utf-8").rstrip())
        parts.append("\n".join(blocks))
        new_content = "\n\n".join(parts) + "\n"
    else:
        existing = args.data_sql.read_text(encoding="utf-8").rstrip()
        if existing and not existing.endswith("\n"):
            existing += "\n"
        new_content = existing + "\n" + "\n".join(blocks)

    args.data_sql.write_text(new_content, encoding="utf-8")

    action = "rewrote" if args.rewrite else "appended"
    print(f"{action} {len(blocks)} problems to {args.data_sql} (skipped={skipped})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
