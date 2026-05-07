---
name: pr-ready
description: Mark a draft PR as ready for review, add the meerkats team as reviewer, and post in the team Google Chat PR channel. Use when the user says the PR is ready, wants to request review, or wants to move out of draft.
---

# Mark PR Ready

## Steps

1. **Get PR details** — run in parallel:
   ```bash
   gh pr view --json number,url,title,isDraft
   git branch --show-current
   ```

2. **Mark as ready** (if still a draft):
   ```bash
   gh pr ready
   ```

3. **Add meerkats as reviewer and append to PR body:**
   ```bash
   gh pr edit --add-reviewer vendasta/meerkats
   ```
   Also append `@vendasta/meerkats` to the end of the PR description:
   ```bash
   BODY=$(gh pr view --json body --jq '.body')
   gh pr edit --body "${BODY}

@vendasta/meerkats"
   ```

4. **Post in the personal team PR channel** — use the bundled script from `notify-pr-channels`:
   ```bash
   PR_URL=$(gh pr view --json url --jq '.url')
   PR_TITLE=$(gh pr view --json title --jq '.title')
   python3 ~/.claude/skills/notify-pr-channels/scripts/chat_post.py "$PR_URL" "$PR_TITLE"
   ```
   User IDs for Craig and Daniel are hardcoded in the script — no need to look them up.

5. **Report back** with the PR URL and confirmation that reviewers were added.

## Notes

- If the PR is already out of draft, skip step 2 — still add reviewer and post.
- Do NOT post in the snapcats channel for `pr-ready` — that's only for build notifications via `notify-pr-channels`.
- Chat posting uses OAuth (not a webhook) — see `notify-pr-channels` skill if auth needs refreshing.
