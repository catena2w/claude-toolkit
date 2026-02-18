#!/bin/bash
# Setup claude-toolkit for the current project
# Detects installation mode and creates symlinks if needed
#
# Usage: bash .claude/shared/setup.sh   (when installed as .claude/shared)
#        bash .claude/setup.sh          (when installed as .claude — no symlinks needed)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Detect installation mode
if [[ "$(basename "$SCRIPT_DIR")" == "shared" ]]; then
    MODE="shared"
    TOOLKIT_REL="shared"
    CLAUDE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
else
    MODE="direct"
    CLAUDE_DIR="$SCRIPT_DIR"
fi

cd "$PROJECT_ROOT"

echo "claude-toolkit setup (mode: $MODE)"
echo "Project root: $PROJECT_ROOT"

# --- Symlinks (only needed in shared mode) ---
if [[ "$MODE" == "shared" ]]; then
    echo ""
    echo "Creating symlinks..."

    # Commands
    mkdir -p .claude/commands
    for cmd in "$SCRIPT_DIR"/commands/*.md; do
        name="$(basename "$cmd")"
        target="../${TOOLKIT_REL}/commands/${name}"
        link=".claude/commands/${name}"
        if [[ -e "$link" && ! -L "$link" ]]; then
            echo "  SKIP: $link (project-specific file exists)"
        else
            ln -sf "$target" "$link"
            echo "  Linked: $link"
        fi
    done

    # Agents
    mkdir -p .claude/agents
    for agent in "$SCRIPT_DIR"/agents/*.md; do
        name="$(basename "$agent")"
        target="../${TOOLKIT_REL}/agents/${name}"
        link=".claude/agents/${name}"
        if [[ -e "$link" && ! -L "$link" ]]; then
            echo "  SKIP: $link (project-specific file exists)"
        else
            ln -sf "$target" "$link"
            echo "  Linked: $link"
        fi
    done

    # Rules
    if [[ -d "$SCRIPT_DIR/rules" ]]; then
        mkdir -p .claude/rules
        for rule in "$SCRIPT_DIR"/rules/*.md; do
            name="$(basename "$rule")"
            target="../${TOOLKIT_REL}/rules/${name}"
            link=".claude/rules/${name}"
            if [[ -e "$link" && ! -L "$link" ]]; then
                echo "  SKIP: $link (project-specific file exists)"
            else
                ln -sf "$target" "$link"
                echo "  Linked: $link"
            fi
        done
    fi

    echo ""
fi

# --- Git hooks ---
echo "Installing git hooks..."

HOOKS_DIR=".git/hooks"
if [[ -f ".git" ]]; then
    # Submodule: .git is a file pointing to the real git dir
    GIT_DIR="$(cat .git | sed 's/gitdir: //')"
    HOOKS_DIR="${GIT_DIR}/hooks"
fi

mkdir -p "$HOOKS_DIR"

for hook in pre-push commit-msg; do
    if [[ -f "$SCRIPT_DIR/hooks/$hook" ]]; then
        cp "$SCRIPT_DIR/hooks/$hook" "$HOOKS_DIR/$hook"
        chmod +x "$HOOKS_DIR/$hook"
        echo "  Installed hook: $hook"
    fi
done

echo ""
echo "Done. Run 'git add .claude/' to track symlinks."
