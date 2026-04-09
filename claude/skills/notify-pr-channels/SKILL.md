---
name: notify-pr-channels
description: Post PR build/ready notifications to the team Google Chat channels. Use when a build passes, a PR is ready for review, or the user asks to notify the team. Posts to personal team channel (with @Craig and @Daniel) and snapcats channel.
---

# Notify PR Channels

When a build passes or a PR is ready, post to **both** channels below.

## Channels

| Channel | Google Chat URL | Notes |
|---|---|---|
| Personal team PR | https://chat.google.com/room/AAAAIj8WMWc?cls=7 | AT Craig and Daniel |
| Snapcats | https://chat.google.com/room/AAAAAHjNt6A?cls=7 | No specific mentions |

## Sending messages

Use the bundled script — no webhook URLs needed, auth is handled via OAuth:

```bash
python3 ~/.claude/skills/notify-pr-channels/scripts/chat_post.py "<PR_URL>" "<PR_TITLE>"
```

The script:
- Posts to the personal team PR channel with @Craig Kumick and @Daniel Ngo mentions
- Posts to the snapcats channel without mentions
- Auth: refreshes OAuth token via GCP secret `google-chat-oauth-client-secret` (repcore-prod), cached at `~/.config/google-chat-cli/credentials-rw.json`

### Known user IDs (hardcoded in script)
- Craig Kumick: `users/101609381686230694100`
- Daniel Ngo: `users/107059066615888383168`

## Steps

1. Get the PR URL and title: `gh pr view --json url,title,number`
2. Run the script:
   ```bash
   python3 ~/.claude/skills/notify-pr-channels/scripts/chat_post.py "<PR_URL>" "<PR_TITLE>"
   ```
