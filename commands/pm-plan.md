---
purpose: Decompose feature into tasks with dependencies
---

# Plan Feature

Decompose the following feature into implementation tasks with dependency tracking.

## Feature
$ARGUMENTS

## Instructions

Delegate to `@project-owner` to:

1. **Understand** the feature — identify user value and business outcomes
2. **Decompose** into atomic tasks (completable in one session each)
3. **Map dependencies** — which tasks block which
4. **Output** a structured plan

## Output Format

Write the plan as a numbered task list. For each task:

```
### Task N: <title>

**User Story:** As a [user], I want [what] so that [why]

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [result]

**Dependencies:**
- Blocked by: [Task numbers] or "None"
- Unblocks: [Task numbers] or "None"

**Effort:** XS / S / M / L
```

After the task list, show the **dependency graph**:

```
Task 1 (ready) ──┬──> Task 4 (blocked)
Task 2 (ready) ──┤
Task 3 (ready) ──┘
```

## Rules

- Split by **user value**, not technical layers
- Mark tasks with no blockers as `ready`
- Keep total tasks under 10
- Each task must have testable acceptance criteria
- Define WHAT, not HOW

After outputting the plan, suggest: "Run `/pm:create-issues` to create GitHub issues from this plan."
