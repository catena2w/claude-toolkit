---
purpose: Start working on a specific issue
---

# Start Issue

Pick up an issue and begin working on it through the TDD workflow.

## Issue
$ARGUMENTS

## Instructions

1. **Read** `params.toml` — check for active session
   - If `current_issue > 0`: Warn "Already working on #N. Close it first or clear session."
   - If `current_issue = 0`: Proceed

2. **Fetch** the issue details:
```bash
gh issue view $ARGUMENTS --json number,title,body,labels
```

3. **Verify** the issue is ready:
   - Must have `ready` label (not `blocked`)
   - Must not be assigned to someone else
   - If blocked: show blockers and suggest `/pm:advance` or pick different issue

4. **Claim** the issue:
```bash
gh issue edit $ARGUMENTS --add-assignee @me --add-label in-progress --remove-label ready
```

5. **Update** `params.toml` session:
```toml
[Session]
current_issue = <number>
issue_title = "<title>"
phase = "red"
branch = "feature/<number>-<short-description>"
started_at = "<ISO datetime>"
```

6. **Create** branch and start work:
```bash
cd projects/<project-name>
git checkout -b feature/<number>-<short-description>
```

7. **Delegate** to the standard workflow:
   - `@architect-review` for initial architecture (if needed)
   - Then enter TDD cycle: `/tdd-red` → `/tdd-green` → `/tdd-refactor`

8. **On completion:**
   - Create PR with "Closes #N" in description
   - Clear session in `params.toml`
   - Run `/pm:advance` to unblock dependent tasks
