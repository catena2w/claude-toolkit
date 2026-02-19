---
purpose: Batch create GitHub issues from plan with dependency links
---

# Create Issues from Plan

Create GitHub issues from the plan discussed in this conversation.

## Instructions

1. **Read** the plan from conversation context (created by `/pm:plan`)
2. **Ensure labels exist** in the repo:

```bash
gh label create ready --color 0E8A16 --description "No blockers, can be picked up" --force
gh label create blocked --color D93F0B --description "Waiting on other issues" --force
gh label create epic --color 1D76DB --description "Epic/feature group" --force
```

4. **Create epic issue** first (groups all tasks):

```bash
gh issue create --title "Epic: <feature name>" --body "<summary + task checklist>" --label epic
```

5. **Create task issues** in dependency order (unblocked first):

For each task, create an issue using the `@project-owner` issue template:
```bash
gh issue create \
  --title "<task title>" \
  --body "<issue body with user story, acceptance criteria, dependencies>" \
  --label "<ready or blocked>"
```

6. **Link dependencies** — after all issues are created:
   - Update each issue body with real GitHub issue numbers in "Blocked by: #XX" / "Unblocks: #ZZ"
   - Update the epic issue body with a checklist: `- [ ] #N <task title>`

7. **Report** the created issues:

```
Created N issues for "<feature>":
  #10 Task A (ready)
  #11 Task B (ready)
  #12 Task C (blocked by #10, #11)
  #13 Task D (blocked by #12)

Epic: #9

Dependency graph:
  #10 (ready) ──┬──> #12 (blocked) ──> #13 (blocked)
  #11 (ready) ──┘
```

## Rules

- Use `@project-owner` issue template format (user story + acceptance criteria + dependencies + out of scope)
- Tasks without blockers get label `ready`
- Tasks with unresolved blockers get label `blocked`
- Always capture and report the issue numbers
- Suggest: "Run `/pm:next` to see ready tasks, or start working on one."
