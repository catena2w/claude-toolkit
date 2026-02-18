#!/bin/bash
# Install git hooks for the current repository
# Usage: Run from the project root directory

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOKS_DIR=".git/hooks"

if [[ ! -d ".git" ]]; then
    echo "ERROR: Not in a git repository root directory."
    exit 1
fi

echo "Installing git hooks..."

# Install pre-push hook
cp "$SCRIPT_DIR/pre-push" "$HOOKS_DIR/pre-push"
chmod +x "$HOOKS_DIR/pre-push"
echo "  Installed: pre-push (prevents direct push to main)"

# Install commit-msg hook
cp "$SCRIPT_DIR/commit-msg" "$HOOKS_DIR/commit-msg"
chmod +x "$HOOKS_DIR/commit-msg"
echo "  Installed: commit-msg (enforces commit message rules)"

echo "Done. Git hooks installed successfully."
