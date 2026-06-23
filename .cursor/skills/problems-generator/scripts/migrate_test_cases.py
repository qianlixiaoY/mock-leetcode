#!/usr/bin/env python3
"""Migrate problem JSON test cases to structured input/output format."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from test_case_format import normalize_problem_test_cases


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Migrate sample_test_cases to structured input objects."
    )
    parser.add_argument(
        "--input",
        type=Path,
        default=Path("data/problems"),
        help="Directory containing *.json problem files",
    )
    args = parser.parse_args()

    json_files = sorted(args.input.glob("*.json"))
    if not json_files:
        print(f"no JSON files in {args.input}", file=sys.stderr)
        return 1

    ok, failed = 0, 0
    for path in json_files:
        try:
            problem = json.loads(path.read_text(encoding="utf-8"))
            normalize_problem_test_cases(problem)
            path.write_text(
                json.dumps(problem, ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )
            ok += 1
        except Exception as exc:
            print(f"FAILED {path.name}: {exc}", file=sys.stderr)
            failed += 1

    print(f"migrated {ok} files, failed {failed}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
