#!/usr/bin/env python3
"""Fetch LeetCode CN Hot 100 problems via GraphQL and write JSON seed files."""

from __future__ import annotations

import argparse
import html
import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

from test_case_format import normalize_problem_test_cases

GRAPHQL_URL = "https://leetcode.cn/graphql/"
STUDY_PLAN_SLUG = "top-100-liked"

STUDY_PLAN_QUERY = """
query studyPlanV2Detail($planSlug: String!) {
  studyPlanV2Detail(planSlug: $planSlug) {
    name
    planSubGroups {
      questions {
        titleSlug
        translatedTitle
        difficulty
        questionFrontendId
      }
    }
  }
}
"""

QUESTION_DETAIL_QUERY = """
query questionDetail($titleSlug: String!) {
  question(titleSlug: $titleSlug) {
    titleSlug
    questionFrontendId
    translatedTitle
    translatedContent
    difficulty
    jsonExampleTestcases
    metaData
    codeSnippets {
      langSlug
      code
    }
  }
}
"""

DIFFICULTY_MAP = {
    "Easy": "EASY",
    "Medium": "MEDIUM",
    "Hard": "HARD",
}

LANG_MAP = {
    "java": "JAVA",
    "javascript": "JAVASCRIPT",
    "typescript": "TYPESCRIPT",
    "python3": "PYTHON",
    "python": "PYTHON",
}


def graphql(operation: str, query: str, variables: dict, referer: str) -> dict:
    body = json.dumps(
        {"operationName": operation, "query": query, "variables": variables}
    ).encode("utf-8")
    req = urllib.request.Request(
        GRAPHQL_URL,
        data=body,
        headers={
            "Content-Type": "application/json",
            "Referer": referer,
            "User-Agent": "mock-leetcode-problems-generator/1.0",
        },
    )
    with urllib.request.urlopen(req, timeout=60) as resp:
        payload = json.loads(resp.read().decode("utf-8"))
    if payload.get("errors"):
        raise RuntimeError(json.dumps(payload["errors"], ensure_ascii=False))
    return payload["data"]


def fetch_hot100_slugs() -> list[str]:
    data = graphql(
        "studyPlanV2Detail",
        STUDY_PLAN_QUERY,
        {"planSlug": STUDY_PLAN_SLUG},
        f"https://leetcode.cn/studyplan/{STUDY_PLAN_SLUG}/",
    )
    slugs: list[str] = []
    for group in data["studyPlanV2Detail"]["planSubGroups"]:
        for q in group["questions"]:
            slugs.append(q["titleSlug"])
    return slugs


def html_to_markdown(content: str) -> str:
    text = content or ""
    text = re.sub(r"(?is)<script.*?>.*?</script>", "", text)
    text = re.sub(r"(?is)<style.*?>.*?</style>", "", text)
    text = re.sub(r"(?is)<pre>\s*<code[^>]*>(.*?)</code>\s*</pre>", r"\n```\n\1\n```\n", text)
    text = re.sub(r"(?is)<code[^>]*>(.*?)</code>", r"`\1`", text)
    text = re.sub(r"(?is)<strong[^>]*>(.*?)</strong>", r"**\1**", text)
    text = re.sub(r"(?is)<h3[^>]*>(.*?)</h3>", r"\n## \1\n", text)
    text = re.sub(r"(?is)<p[^>]*>", "\n", text)
    text = re.sub(r"(?is)</p>", "\n", text)
    text = re.sub(r"(?is)<li[^>]*>", "\n- ", text)
    text = re.sub(r"(?is)</li>", "", text)
    text = re.sub(r"(?is)<br\s*/?>", "\n", text)
    text = re.sub(r"(?is)<[^>]+>", "", text)
    text = html.unescape(text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def clean_expected_output(value: str) -> str:
    text = value.strip()
    text = re.split(r'(?:\*\*)?解释[：:]', text, maxsplit=1)[0].strip()
    text = re.split(r'(?:\*\*)?示例\s*\d+[：:]', text, maxsplit=1)[0].strip()
    return text


def parse_examples_from_html(content: str) -> list[dict[str, str]]:
    examples: list[dict[str, str]] = []
    patterns = [
        re.compile(
            r"<strong>输入[：:]?\s*</strong>(.*?)<strong>输出[：:]?\s*</strong>(.*?)(?=</p>)",
            re.S,
        ),
        re.compile(
            r"<strong>输入[：:]?\s*</strong>(.*?)<strong>输出[：:]?\s*</strong>(.*?)(?=<strong>|</p>|$)",
            re.S,
        ),
    ]
    for pattern in patterns:
        for match in pattern.finditer(content or ""):
            raw_input = html.unescape(re.sub(r"<[^>]+>", "", match.group(1))).strip()
            raw_output = clean_expected_output(
            html.unescape(re.sub(r"<[^>]+>", "", match.group(2))).strip()
        )
            examples.append({"raw_input": raw_input, "expected_output": raw_output})
        if examples:
            break
    return examples


def parse_examples_from_markdown(content: str) -> list[dict[str, str]]:
    examples: list[dict[str, str]] = []
    patterns = [
        re.compile(
            r"\*\*输入[：:]?\*\*\s*(.*?)\s*\*\*输出[：:]?\s*\*\*\s*(.*?)(?=\*\*示例|\*\*解释|\*\*提示|\Z)",
            re.S,
        ),
        re.compile(
            r"\*\*输入[：:]?\*\*\s*(.*?)\s*\*\*输出[：:]?\*\*\s*(.*?)(?=\*\*示例|\*\*解释|\*\*提示|\Z)",
            re.S,
        ),
        re.compile(
            r"输入[：:]\s*(.*?)\s*输出[：:]\s*(.*?)(?=\*\*示例\s*\d|\*\*提示|\Z)",
            re.S,
        ),
    ]
    for pattern in patterns:
        for match in pattern.finditer(content or ""):
            raw_input = match.group(1).strip()
            raw_output = clean_expected_output(
            re.sub(r"\*\*.*", "", match.group(2), flags=re.S).strip()
        )
            examples.append({"raw_input": raw_input, "expected_output": raw_output})
        if examples:
            break
    return examples


def normalize_input(raw_input: str, json_input: str | None) -> str:
    if json_input:
        return json_input
    return raw_input.strip()


def build_description_md(
    frontend_id: str, title: str, markdown_body: str
) -> str:
    heading = f"# {frontend_id}. {title}"
    if markdown_body.startswith("#"):
        return markdown_body
    return f"{heading}\n\n{markdown_body}"


def fetch_problem(slug: str) -> dict:
    data = graphql(
        "questionDetail",
        QUESTION_DETAIL_QUERY,
        {"titleSlug": slug},
        f"https://leetcode.cn/problems/{slug}/",
    )["question"]

    json_cases = json.loads(data.get("jsonExampleTestcases") or "[]")
    html_examples = parse_examples_from_html(data.get("translatedContent") or "")
    body_md = html_to_markdown(data.get("translatedContent") or "")
    if not html_examples:
        html_examples = parse_examples_from_markdown(body_md)

    sample_test_cases = []
    for i, example in enumerate(html_examples):
        json_input = json_cases[i] if i < len(json_cases) else None
        sample_test_cases.append(
            {
                "input": normalize_input(example["raw_input"], json_input),
                "expected_output": example["expected_output"],
                "is_sample": True,
                "sort_order": i + 1,
            }
        )

    snippets = {}
    for snip in data.get("codeSnippets") or []:
        lang = LANG_MAP.get(snip.get("langSlug", ""))
        if lang:
            snippets[lang] = snip["code"]

    difficulty = DIFFICULTY_MAP.get(data.get("difficulty", ""), "MEDIUM")
    title = data.get("translatedTitle") or slug
    frontend_id = data.get("questionFrontendId") or "0"

    return normalize_problem_test_cases(
        {
            "id": int(frontend_id),
            "title": title,
            "slug": data.get("titleSlug") or slug,
            "difficulty": difficulty,
            "description_md": build_description_md(frontend_id, title, body_md),
            "time_limit_ms": 2000,
            "memory_limit_mb": 256,
            "sample_test_cases": sample_test_cases,
            "code_snippets": snippets,
            "meta_data": json.loads(data.get("metaData") or "{}"),
        }
    )


def write_problem(out_dir: Path, problem: dict) -> Path:
    out_dir.mkdir(parents=True, exist_ok=True)
    path = out_dir / f"{problem['slug']}.json"
    path.write_text(
        json.dumps(problem, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return path


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Fetch LeetCode CN Hot 100 problems into JSON seed files."
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=Path("data/problems"),
        help="Output directory (default: data/problems)",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=0,
        help="Max problems to fetch (0 = all)",
    )
    parser.add_argument(
        "--slug",
        action="append",
        dest="slugs",
        help="Fetch only these slugs (can repeat)",
    )
    parser.add_argument(
        "--skip-existing",
        action="store_true",
        help="Skip slugs whose JSON file already exists",
    )
    parser.add_argument(
        "--delay",
        type=float,
        default=0.5,
        help="Seconds to wait between requests (default: 0.5)",
    )
    args = parser.parse_args()

    slugs = args.slugs or fetch_hot100_slugs()
    if args.limit > 0:
        slugs = slugs[: args.limit]

    ok, skipped, failed = 0, 0, 0
    for i, slug in enumerate(slugs, start=1):
        out_path = args.out / f"{slug}.json"
        if args.skip_existing and out_path.exists():
            print(f"[{i}/{len(slugs)}] skip {slug} (exists)")
            skipped += 1
            continue

        print(f"[{i}/{len(slugs)}] fetch {slug} ...", end=" ", flush=True)
        try:
            problem = fetch_problem(slug)
            write_problem(args.out, problem)
            print(f"ok -> {out_path}")
            ok += 1
        except (urllib.error.URLError, RuntimeError, json.JSONDecodeError) as exc:
            print(f"FAILED: {exc}")
            failed += 1

        if i < len(slugs) and args.delay > 0:
            time.sleep(args.delay)

    print(f"done: ok={ok} skipped={skipped} failed={failed}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
