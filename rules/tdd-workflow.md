---
purpose: TDD workflow reference
---

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

When writing a plan, include this workflow explicitly into the plan.

## Project structure

Check docs/architecture.md for project structure and available classes.
