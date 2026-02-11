---
name: git-worktree-jira-branch
description: When starting new work, create a new git worktree with kebab-case name and a JIRA-style branch from origin/master. Use when the user wants a new worktree, new branch, or mentions JIRA ticket workflow.
---

# Git worktree + JIRA-style branch

Use this skill when starting new work that should live in its own worktree and branch.

## Naming convention

- **Worktree path (lowercase kebab):** `{repo}-{jira-ticket-lower}-{work-description}`
  - Example: `email-kat-1376-use-immutable-ids`
- **Branch (slash, not hyphen):** `{JIRA-TICKET}/{work-description}` — use a **slash** between ticket and description. Required for the git commit prehook (XXX-0000/description shape).
  - ✅ Correct: `KAT-1376/use-immutable-ids`, `KAT-1384/outlook-reply-is-contact`
  - ❌ Wrong: `KAT-1376-use-immutable-ids`, `KAT-1384-outlook-reply-is-contact` (hyphens instead of slash)
- **Base:** Create the branch from `origin/master`. The branch must **not** track `origin/master`; it should track `origin/{TICKET}/{description}` so pushes go to the feature branch (see Remote tracking below).

## When to use

- User asks for a new worktree or branch for a JIRA ticket.
- User says they like "new work" in a new worktree with kebab-style name and JIRA-style branch.
- Starting implementation for a ticket (e.g. KAT-1376, KAT-1318).

## Instructions

1. **Resolve repo and ticket:** From context, get the repo name (e.g. `email`), the JIRA ticket (e.g. `KAT-1376`), and a short work description (e.g. `use-immutable-ids`). Use kebab-case for the description.

2. **Worktree path:** Build the worktree path as `{repo}-{ticket-lower}-{description}` and place it as a sibling of the main repo.
   - Example: repo at `/Users/you/Projects/email` → worktree at `/Users/you/Projects/email-kat-1376-use-immutable-ids`

3. **Branch name:** Always `{TICKET}/{description}` with a **slash** (never hyphen). Matches prehook expectation XXX-0000/description.
   - Example: `KAT-1376/use-immutable-ids`, `KAT-1318/create-trkd-msg-evnt`

4. **Create worktree and branch:** Use the slash-form branch name from the start. Do **not** create the branch with a hyphenated name and rename later.
   ```bash
   cd /path/to/repo
   git fetch origin
   git worktree add ../{worktree-name} -b {TICKET}/{description} origin/master
   ```
   The new branch has no upstream yet. That is correct: the remote branch will be created on first push.

5. **Remote tracking (first push):** The worktree branch should track `origin/{TICKET}/{description}`, not `origin/master`. Do **not** set upstream in the create step (the remote branch does not exist yet). Tell the user: on first push from the worktree, run:
   ```bash
   git push -u origin '{TICKET}/{description}'
   ```
   That creates the remote branch and sets tracking. After that, plain `git push` and `git pull` use the feature branch.

6. **Confirm:** Tell the user the worktree path, branch name (slash form), and the first-push command above.

## Examples

| Repo  | Ticket   | Description        | Worktree path                          | Branch                 |
|-------|----------|--------------------|----------------------------------------|------------------------|
| email | KAT-1376 | use-immutable-ids | `../email-kat-1376-use-immutable-ids`  | `KAT-1376/use-immutable-ids` |
| email | KAT-1318 | hawt-fix           | `../email-kat-1318-hawt-fix`           | `KAT-1318/hawt-fix`    |

## Fixing an existing worktree

If the worktree was created with the wrong branch name (e.g. hyphenated) or the branch is tracking `origin/master`:

1. **From the worktree directory:** Fetch latest, then rename the branch to the slash form and reset to `origin/master`:
   ```bash
   cd /path/to/worktree
   git fetch origin
   git branch -m {old-name} '{TICKET}/{description}'
   git reset --hard origin/master
   ```
2. **First push:** Run `git push -u origin '{TICKET}/{description}'` to create the remote branch and set tracking. Do not set upstream before pushing (the remote branch does not exist yet).

## References

- [Cursor docs: Skill directories](https://cursor.com/docs/context/skills#skill-directories) — skills can live in `~/.cursor/skills/` or `~/.claude/skills/`.
