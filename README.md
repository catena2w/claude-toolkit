# claude-toolkit

Shared Claude Code skills for software development teams.

## Installation

```bash
git submodule add git@github.com:catena2w/claude-toolkit.git .claude/shared
bash .claude/shared/setup.sh
git add .claude/
```

Setup creates symlinks so Claude Code discovers commands and agents.
Project-specific files in `.claude/commands/` or `.claude/agents/` are preserved.

## Contents

### Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| `@architect-review` | Opus | Architecture review, SOLID, design patterns |
| `@code-reviewer` | Opus | Code quality, security, performance |
| `@database-architect` | Opus | DB design, schema modeling, migrations |
| `@security-auditor` | Opus | OWASP, DevSecOps, compliance |
| `@tdd-orchestrator` | Opus | TDD workflow coordination, discipline |
| `@test-automator` | Sonnet | Test generation, automation, quality |

### Commands

| Command | Purpose |
|---------|---------|
| `/tdd-cycle <feature>` | Full 12-phase TDD workflow |
| `/tdd-red <requirement>` | Write failing tests |
| `/tdd-green` | Minimal implementation to pass |
| `/tdd-refactor` | Improve code, keep tests green |
| `/review <scope>` | Quality gate reviews (code + security + architecture) |
| `/commit` | Commit with feature-branch PR workflow |

### Hooks

| Hook | Purpose |
|------|---------|
| `pre-push` | Prevent direct push to main |
| `commit-msg` | Enforce commit message rules (capital start, 72 chars, no period) |
