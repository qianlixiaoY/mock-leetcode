import re
from pathlib import Path

text = Path("backend/oj-api/src/main/resources/data.sql").read_text(encoding="utf-8")
slugs = re.findall(r"'([a-z0-9-]+)',\s*\r?\n\s*'(?:EASY|MEDIUM|HARD)'", text)
print("problem count:", len(slugs))
print("unique slugs:", len(set(slugs)))
dups = sorted({s for s in slugs if slugs.count(s) > 1})
print("duplicates:", dups or "none")
print("template inserts:", text.count("INSERT IGNORE INTO problem_template"))
print("test_case inserts:", text.count("INSERT IGNORE INTO test_case"))
print("file size MB:", round(len(text.encode("utf-8")) / 1024 / 1024, 2))
