# Commit Changes

Commit all uncommitted changes and push to main.

## Usage

- `/commit` — Commit and push to main

## Steps

### 1. Quality gates (always first)

```bash
git diff --name-only
```

For each changed `.md` file, verify:
- [ ] YAML frontmatter exists (`purpose`, `updated`)
- [ ] `updated` date is today (YYYY-MM-DD)
- [ ] If new file: added to relevant `_index.md`

For changed `_index.md` files:
- [ ] All listed files exist
- [ ] No missing entries for new files in that folder

**If issues found:** fix them before proceeding. Update `updated` field, add missing index entries.

### 2. Check for changes

```bash
git status
git diff --stat
```

If no changes, respond: "Nothing to commit."

### 3. Stage all changes

```bash
git add -A
```

### 4. Generate commit message

Review the staged changes and write a concise commit message:
- Focus on what changed, not how
- Use imperative mood ("add feature" not "added feature")
- Keep first line under 72 characters
- NO Co-Authored-By line

### 5. Commit and push

```bash
git commit -m "$(cat <<'EOF'
[commit message here]
EOF
)"
git push origin main
```

**Output to user:**
```
## Changes pushed to main

[Summary of changes]

**Commit:** [commit hash]
```

## Safety

- Always run `git status` first to verify what will be committed
- Warn if committing sensitive files (.env, credentials, etc.)
