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
      "sort_order": 1,
      "is_sample": true,
      "input": {
        "prices": [7, 1, 5, 3, 6, 4]
      },
      "expected_output": 7
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

## Test case `input` rules

- `input` is always a JSON **object** whose keys are parameter names.
- Multi-parameter problems use keys from `meta_data.params[].name`:

```json
{
  "input": {
    "l1": [2, 4, 3],
    "l2": [5, 6, 4]
  },
  "expected_output": [7, 0, 8]
}
```

- Single-parameter problems choose the key **per sample case** from the matching
  `description_md` example (by example order):
  - Example shows a named input like `prices = [...]` → use that param name.
  - Example shows only a bare value like `[7,1,5,3,6,4]` → use default key **`input`**.

```json
[
  {
    "input": { "input": [7, 1, 5, 3, 6, 4] },
    "expected_output": 5
  },
  {
    "input": { "prices": [7, 6, 4, 3, 1] },
    "expected_output": 0
  }
]
```

- System-design problems (`meta_data.systemdesign = true`) use:

```json
{
  "input": {
    "operations": ["LRUCache", "put", "get"],
    "arguments": [[2], [1, 1], [1]]
  },
  "expected_output": [null, null, 1]
}
```

- `expected_output` uses native JSON types (`number`, `boolean`, `string`, `array`, `null`), not stringified JSON.

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

`test_case.input` and `test_case.expected_output` are stored as JSON text.

Reference seed format: `backend/oj-api/src/main/resources/data.sql`.
