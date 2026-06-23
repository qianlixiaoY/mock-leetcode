---
name: problems-generator
description: >-
  Extracts LeetCode CN Hot 100 problem descriptions and sample test cases
  into mock-leetcode JSON seed files via GraphQL. Use when importing Hot 100,
  generating problem data, scraping leetcode.cn study plan top-100-liked,
  or converting problems into data.sql format.
disable-model-invocation: true
---

# Problems Generator

Import LeetCode CN **Hot 100** (`top-100-liked`) into this repo as JSON files under `data/problems/`.

## Do NOT

- Do not use browser click automation or OCR
- Do not scrape with fragile CSS selectors

## Quick start

From repo root:

```bash
py -3 .cursor/skills/problems-generator/scripts/fetch_hot100.py --out data/problems --skip-existing
```

Fetch a single problem:

```bash
py -3 .cursor/skills/problems-generator/scripts/fetch_hot100.py --slug two-sum --out data/problems
```

Dry run on first 3:

```bash
py -3 .cursor/skills/problems-generator/scripts/fetch_hot100.py --limit 3 --out data/problems
```

## Workflow

1. Run `scripts/fetch_hot100.py` (GraphQL, no login required for public Hot 100)
2. Verify output JSON against [references/output-schema.md](references/output-schema.md)
3. Merge JSON into SQL:

```bash
py -3 .cursor/skills/problems-generator/scripts/json_to_sql.py --input data/problems --data-sql backend/oj-api/src/main/resources/data.sql
```

## Data sources

| Step | API | Endpoint |
|------|-----|----------|
| List Hot 100 slugs | `studyPlanV2Detail` | `https://leetcode.cn/graphql/` |
| Problem detail | `questionDetail` | `https://leetcode.cn/graphql/` |

Request shapes are captured in `leetcode.cn.har` at repo root. The script uses stdlib only (no pip deps).

## Output

- Path: `data/problems/{slug}.json`
- Fields align with `problem`, `test_case`, and `problem_template` tables
- Sample test cases: `input` from `jsonExampleTestcases`, `expected_output` parsed from HTML examples

## Agent checklist

When the user asks to import or refresh Hot 100 problems:

- [ ] Run fetch script with `--skip-existing` unless a full refresh is requested
- [ ] Spot-check 1–2 JSON files (title, description_md, sample_test_cases)
- [ ] Report ok / skipped / failed counts
- [ ] If converting to SQL, preserve `INSERT IGNORE` style from existing `data.sql`

## Limitations

- Only **sample** test cases are exported (from public examples), not hidden judge cases
- Multi-parameter inputs may need manual normalization for complex formats
- Respect LeetCode rate limits; default `--delay 0.5` between requests
