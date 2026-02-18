# CLAUDE.md

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
| `/pm:plan <feature>` | Decompose feature into tasks with dependencies |
| `/pm:create-issues` | Batch create GitHub issues from plan |
| `/pm:start <number>` | Pick up an issue and start TDD workflow |
| `/pm:next` | Show ready (unblocked) issues |
| `/pm:advance` | Close done issues, unblock next batch |
| `/pm:status` | Project dashboard |
| `/tdd-cycle <feature>` | Full TDD workflow (12 phases) |
| `/tdd-red <requirement>` | Write failing tests |
| `/tdd-green` | Minimal implementation to pass |
| `/tdd-refactor` | Improve code, keep tests green |
| `/review <scope>` | Quality gate reviews |
| `/commit` | Smart commit with PR workflow |

## Project description

