# Problem JSON output schema

Each fetched problem is written to `data/problems/{slug}.json`:

```json
{
  "id": 122,
  "title": "买卖股票的最佳时机 II",
  "slug": "best-time-to-buy-and-sell-stock-ii",
  "difficulty": "MEDIUM",
  "description_md": "# 122. 买卖股票的最佳时机 II\n\n...",
  "time_limit_ms": 2000,
  "memory_limit_mb": 256,
  "sample_test_cases": [
    {
      "input": "[7,1,5,3,6,4]",
      "expected_output": "7",
      "is_sample": true,
      "sort_order": 1
    }
  ],
  "code_snippets": {
    "JAVA": "class Solution { ... }",
    "JAVASCRIPT": "var maxProfit = function(prices) { ... }",
    "TYPESCRIPT": "function maxProfit(prices: number[]): number { ... }",
    "PYTHON": "class Solution: ..."
  },
  "meta_data": {
    "name": "maxProfit",
    "params": [{ "name": "prices", "type": "integer[]" }],
    "return": { "type": "integer" }
  }
}
```

## Mapping to `data.sql`

| JSON field | SQL table.column |
|------------|------------------|
| `id` | `problem.id` |
| `title` | `problem.title` |
| `slug` | `problem.slug` |
| `difficulty` | `problem.difficulty` |
| `description_md` | `problem.description_md` |
| `time_limit_ms` | `problem.time_limit_ms` |
| `memory_limit_mb` | `problem.memory_limit_mb` |
| `sample_test_cases[]` | `test_case` rows with `is_sample = TRUE` |
| `code_snippets` | `problem_template.template_code` |

Reference seed format: `backend/oj-api/src/main/resources/data.sql`.
