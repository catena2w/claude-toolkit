# CLAUDE.md


## Philosophy

- **Architecture** - Class responsibilities defined in [Architecture Map](docs/architecture.md)
- **KISS** - Simple solutions over complex ones.
- **YAGNI** - Build only what's needed now. Less code is better.
- **DRY** - Single source of truth. Never Copy-paste
- **OOP** - Follow OOP approach and best practices
- **SOLID** - Enforce Single responsibility principle, keep in mind others when possible
- **No Magic** - Make everything explicit, no hidden behavior or implicit transformations
- **Small Steps** - Minimal changes, commit often
- **Use Libraries** - Prefer established libraries (ORMs, validators, parsers) over reimplementing features; check ecosystem before writing custom code
- **Backwards Compatibility** - Don't keep code for backwards compatibility purposes
- **CI** - Automate all possible quality checks
- **Investigate, Don't Mask** - When a check fails or unexpected behavior occurs, investigate the root cause instead of adding defensive code to mask the symptom

## Project structure

Check docs/architecture.md for project structure and available classes.

## Scratch Testing

**ALWAYS use `test.py`** in project root for:
- Ad-hoc testing, API calls, data exploration
- Any Python code that isn't a formal test or production code
- **NEVER use inline Python heredocs via Bash** (`uv run python3 << 'EOF'`)

Write code to `test.py`, then run with `uv run python test.py`. Comment out previous code - keeps history.

## Agents

| Agent | Role |
|-------|------|
| `@tdd-orchestrator` | Coordinate TDD workflow, enforce discipline |
| `@test-automator` | AI-powered test automation, quality engineering |
| `@code-reviewer` | Quality review, security, production reliability |
| `@security-auditor` | OWASP, DevSecOps, compliance |
| `@architect-review` | Architecture, SOLID, validate against [Architecture Map](docs/architecture.md) |
| `@database-architect` | DB design, schema modeling, migrations |

## Commands

| Command | Purpose |
|---------|---------|
| `/tdd-cycle <feature>` | Full TDD workflow (12 phases) |
| `/tdd-red <requirement>` | Write failing tests |
| `/tdd-green` | Minimal implementation to pass |
| `/tdd-refactor` | Improve code, keep tests green |
| `/review <scope>` | Quality gate reviews |
| `/commit` | Smart commit with PR workflow |


## Workflow

```
1. Extract <requirement> - a minimum possible piece of logic
2. /tdd-red "<requirement>"  → single integration failing test that checks <requirement>
3. /tdd-green                → minimal code to pass
4. /tdd-refactor             → improve structure
5. /commit                   → commit after every logical change
6. REPEAT 1-4 till task is implemented
7. /review <scope>
```

When you writing a plan, include this workflow explicitly into the plan.

## Project description

