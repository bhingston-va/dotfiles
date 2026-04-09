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

## Sending messages via webhook

Each room needs an incoming webhook URL. These are configured in Google Chat under **Room settings → Apps & integrations → Add webhooks**. Once you have them, post with:

```bash
curl -s -X POST "<WEBHOOK_URL>" \
  -H 'Content-Type: application/json' \
  -d '{"text": "<message>"}'
```

### Webhook URLs (fill in once configured)

- **Personal team PR webhook**: *(ask user or check project secrets)*
- **Snapcats webhook**: *(ask user or check project secrets)*

## Message format

### Personal team PR channel
```
PR ready / Build passing: <PR title> (<PR URL>)
@Craig @Daniel — FYI
```

Mentioning users requires their Google Chat user IDs in the format `<users/USER_ID>`. Look up IDs by fetching a message they've sent in the room using the google-chat-fetcher skill, then extract from the `sender.name` field.

### Snapcats channel
```
PR ready / Build passing: <PR title> (<PR URL>)
```

## Steps

1. Get the PR URL and title: `gh pr view --json url,title,number`
2. If you don't have webhook URLs, ask the user: "Do you have webhook URLs for the team PR channel and snapcats channel?"
3. Look up Craig and Daniel's user IDs using the `vendasta-dev-agent-toolkit:google-chat-fetcher` skill on the personal team PR room if not already known
4. Post to both channels via curl using the webhook URLs
