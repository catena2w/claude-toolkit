# Review Command

Run quality gate reviews on the specified scope.

## Scope
$ARGUMENTS

## Instructions

Run the following reviews in sequence:

### 1. Code Review
Use @code-reviewer to analyze:
- Code quality and maintainability
- Best practices adherence
- Style consistency

### 2. Security Audit
Use @security-auditor to check:
- OWASP Top 10 vulnerabilities
- Smart contract security (if Solidity)
- Input validation and access control

### 3. Architecture Review
Use @architect-review to verify:
- Architectural consistency
- Design pattern usage
- YAGNI principles
- Other principles from CLAUDE.md Philosophy

## Output Summary

After all reviews, provide a combined verdict:

```
## Quality Gate Summary

| Review | Verdict | Critical | Major | Minor |
|--------|---------|----------|-------|-------|
| Code   | pass/warn/fail | N | N | N |
| Security | pass/warn/fail | N | N | N |
| Architecture | pass/warn/fail | N | N | N |

**Overall**: PASS / NEEDS WORK / FAIL

### Action Items
1. [critical/major items to address]
```
