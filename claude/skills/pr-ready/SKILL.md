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

4. **Post in the personal team PR channel** — use the `notify-pr-channels` skill for channel URLs, webhook setup, and message format. Summary:
   ```bash
   curl -s -X POST "<PERSONAL_TEAM_WEBHOOK_URL>" \
     -H 'Content-Type: application/json' \
     -d "{\"text\": \"PR ready for review: <PR title> (<PR URL>)\n@Craig @Daniel\"}"
   ```
   - Channel: https://chat.google.com/room/AAAAIj8WMWc?cls=7
   - Always AT Craig and Daniel in this channel
   - For proper @mentions you need their Google Chat user IDs — use the `vendasta-dev-agent-toolkit:google-chat-fetcher` skill on the room to find them from past messages (`sender.name` field)

5. **Report back** with the PR URL and confirmation that reviewers were added.

## Notes

- If the PR is already out of draft, skip step 2 — still add reviewer and post.
- Do NOT post in the snapcats channel for `pr-ready` — that's only for build notifications via `notify-pr-channels`.
- If no webhook URL is available, ask the user: "Do you have a webhook URL for the team PR Google Chat room?"
