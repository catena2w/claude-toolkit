# claude-toolkit

Shared Claude Code skills for software development teams.

## Setup

Add to your project as a submodule:

```
git submodule add git@github.com:catena2w/claude-toolkit.git .claude/shared
```

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
| `/commit` | Commit with quality gates and push |

### Hooks

| Hook | Purpose |
|------|---------|
| `pre-push` | Prevent direct push to main |
| `commit-msg` | Enforce commit message rules (capital start, 72 chars, no period) |
| `install-hooks.sh` | Install hooks into `.git/hooks/` |

## Install Hooks

```bash
bash .claude/shared/hooks/install-hooks.sh
```
