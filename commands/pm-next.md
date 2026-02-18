---
purpose: Show ready (unblocked) issues available for work
---

# Next Available Tasks

Show issues that are ready to be worked on.

## Instructions

1. **Check** current session in `params.toml`
2. **List** ready issues:

```bash
gh issue list --label ready --state open --json number,title,assignees,labels
```

3. **Check** current session state:
   - If `current_issue > 0`: Show "Currently working on #N: <title> (phase: <phase>)"
   - If `current_issue = 0`: Show available tasks

4. **Display** results:

```
Ready tasks (no blockers):
  #10 Task A — unassigned
  #11 Task B — unassigned
  #12 Task C — assigned to @worker-a

Blocked tasks waiting:
  #13 Task D — blocked by #10, #11
```

5. **Suggest** next action:
   - "Pick a task with `/pm:start <number>`" (if no active work)
   - "Finish current issue first, or `/pm:advance` to update states" (if active work)

## Parallel Opportunities

If multiple ready tasks exist, note which can run in parallel:
- Different modules/directories → can parallelize
- Shared files → must be sequential
