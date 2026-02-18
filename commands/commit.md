Commit changes, push to remote, and create PR if needed.

## Workflow

1. **Branch Check**
   - If on `main`: prompt for branch type and description, then `git checkout -b <type>/<description>`
   - Valid types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`

2. **Auto-fix before commit**
   - Run project linter/formatter if configured (check CLAUDE.md for project-specific tools)
   - Pre-commit hooks will verify quality gates

3. **Commit & Push**
   - Stage all changes: `git add -A`
   - Generate concise commit message from diff
   - Commit and push: `git push -u origin <branch>`

4. **Merge Main**
   - `git fetch origin main && git merge origin/main`
   - If conflicts: resolve, commit merge, push
   - If clean: push

5. **PR Creation** (first push only)
   - Check if PR exists: `gh pr list --head <branch>`
   - If no PR: `gh pr create --fill`

6. **Branch Cleanup**
   - Delete local branches already merged into main: `git branch --merged main | grep -v '^\*\|main' | xargs -r git branch -d`
   - Prune remote tracking branches: `git fetch --prune`

## Rules

- Never commit directly to `main`
- One logical change per commit
- Commit message rules enforced by hook (see `.claude/shared/hooks/commit-msg`):
  capital start, ≤72 chars, no trailing period, no Co-Authored-By
