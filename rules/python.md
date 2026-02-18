---
purpose: Python project conventions
globs: "*.py"
---

## Scratch Testing

**ALWAYS use `test.py`** in project root for:
- Ad-hoc testing, API calls, data exploration
- Any Python code that isn't a formal test or production code
- **NEVER use inline Python heredocs via Bash** (`uv run python3 << 'EOF'`)

Write code to `test.py`, then run with `uv run python test.py`. Comment out previous code - keeps history.
