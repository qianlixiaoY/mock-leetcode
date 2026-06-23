import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
PROBLEMS = ROOT / "data" / "problems"
FETCH = ROOT / ".cursor/skills/problems-generator/scripts/fetch_hot100.py"

empty = []
for path in PROBLEMS.glob("*.json"):
    data = json.loads(path.read_text(encoding="utf-8"))
    if not data.get("sample_test_cases"):
        empty.append(path.stem)

print(f"refreshing {len(empty)} problems")
for slug in empty:
    subprocess.run(
        [sys.executable, str(FETCH), "--slug", slug, "--out", str(PROBLEMS), "--delay", "0.3"],
        check=True,
    )
