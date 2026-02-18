---
purpose: Close done issues, unblock next batch, update dependency states
---

# Advance Project State

Update issue states after task completions. Unblock newly ready tasks.

## Instructions

1. **Find closed blockers** — issues that were recently closed:

```bash
gh issue list --label "ready,blocked" --state closed --json number,title
```

3. **Scan blocked issues** for unresolved dependencies:

```bash
gh issue list --label blocked --state open --json number,title,body
```

4. **For each blocked issue:**
   - Parse "Blocked by: #XX, #YY" from the issue body
   - Check if ALL blockers are closed:
     ```bash
     gh issue view <blocker_number> --json state -q .state
     ```
   - If all blockers are closed → **unblock it**:
     ```bash
     gh issue edit <number> --remove-label blocked --add-label ready
     ```

5. **Update epic checklist** — mark completed tasks:
   - Find the epic issue (label: `epic`)
   - Update checklist items from `- [ ] #N` to `- [x] #N` for closed issues

6. **Report** state changes:

```
Advance summary:
  Completed: #10 Task A, #11 Task B
  Newly unblocked: #12 Task C (was blocked by #10, #11) → now ready
  Still blocked: #13 Task D (waiting on #12)

  Progress: 2/6 tasks done (33%)

Ready to work on:
  #12 Task C
```

7. **Suggest** next action:
   - "Pick a ready task to start working on"
   - Or if multiple ready: "Multiple tasks available — consider `/swarm` for parallel execution"
