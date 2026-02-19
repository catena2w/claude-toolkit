---
purpose: Dashboard of project state — issues, progress, blockers
---

# Project Status

Show a comprehensive dashboard of the current project state.

## Instructions

1. **Check** current session in `params.toml`

2. **Gather** data from GitHub:

```bash
# All issues with our labels
gh issue list --state all --label "ready,blocked,in-progress,epic" --json number,title,state,labels,assignees
```

3. **Display** dashboard:

```
## Project: <repo name>

### Current Session
Worker: <worker name> | Issue: #N <title> | Phase: <phase>
(or: No active work)

### Epic: #9 <feature name>
Progress: ████████░░░░ 4/6 tasks (67%)

### Tasks
  Done:        #10 Task A ✓, #11 Task B ✓
  In progress: #14 Task E (@worker-a, phase: green)
  Ready:       #12 Task C, #15 Task F
  Blocked:     #13 Task D (by #12)

### Dependency Graph
  #10 ✓ ──┬──> #12 (ready) ──> #13 (blocked)
  #11 ✓ ──┘
  #14 (in-progress) ──> #15 (ready)
```

4. **Highlight** actionable items:
   - Blocked tasks that could be unblocked (all blockers done) → suggest `/pm:advance`
   - Ready tasks with no assignee → suggest picking one up
   - Stale in-progress tasks (no recent commits) → flag for review
