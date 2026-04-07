#!/bin/bash
# Auto-approve destructive commands in ~/Projects (non-main/master) and ~/dotfiles.
# Deny on main/master in ~/Projects. Prompt elsewhere.

INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

allow() { echo '{"hookSpecificOutput":{"hookEventName":"PermissionRequest","decision":{"behavior":"allow"}}}'; exit 0; }
deny()  { echo "{\"hookSpecificOutput\":{\"hookEventName\":\"PermissionRequest\",\"decision\":{\"behavior\":\"deny\",\"message\":\"$1\"}}}"; exit 0; }

# dotfiles: always allow
if [[ "$CWD" == "$HOME/dotfiles"* || "$CWD" == "$HOME/.claude"* ]]; then
  allow
fi

# Only apply logic inside ~/Projects
if [[ "$CWD" != "$HOME/Projects"* ]]; then
  exit 0  # fall through to normal prompt
fi

# Must be a git repo
if ! git -C "$CWD" rev-parse --git-dir > /dev/null 2>&1; then
  exit 0  # fall through to normal prompt
fi

BRANCH=$(git -C "$CWD" rev-parse --abbrev-ref HEAD 2>/dev/null)

if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
  deny "Blocked on branch '$BRANCH' in ~/Projects. Switch to a feature branch first."
fi

allow
