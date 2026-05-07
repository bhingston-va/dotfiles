---
name: wsu
description: Create and fill a new Weekly Status Update (WSU) Confluence page. Use when the user wants to create a new WSU or update the current week's status. Gathers data from GitHub, GChat, and git commits, then runs a short questionnaire for contributions not visible in tooling.
---

# Weekly Status Update (WSU)

Creates a new WSU page for the current week under the correct quarter parent, gathers data from multiple sources, asks a questionnaire for off-system contributions, and fills in the page.

## Confluence config

| Field | Value |
|-------|-------|
| Cloud ID | `77fcf126-19b9-4276-9a8f-9d9fa1efe60f` |
| Space ID | `1518010429` |
| Space key | `~106705950` |

Quarter parent pages (add new ones as quarters roll over):

| Quarter | Page ID | Title |
|---------|---------|-------|
| Q2 2026 | `4046848046` | WSU 2026 Q2 |

To find the parent for a future quarter, search Confluence for a page titled "WSU YYYY QN" in the space.

## Title convention

`Benj Hingston - YYYY-MM-DD QJWK`

- **YYYY-MM-DD** — the Friday of the current work week
- **J** — quarter number (1 = Jan–Mar, 2 = Apr–Jun, 3 = Jul–Sep, 4 = Oct–Dec)
- **K** — week number within the quarter; find the most recent child page under the quarter parent and increment K by 1. Note: K can jump by more than 1 if Benj was on vacation.

## Steps

### 1. Determine the title

1. Get today's date.
2. Compute the Friday of the current ISO work week.
3. Derive the quarter from the month.
4. Use the Confluence MCP to list children of the quarter parent page (ordered by `created DESC`) and read the last K used — increment by 1.
5. Construct: `Benj Hingston - YYYY-MM-DD QJWK`

### 2. Read the previous week's WSU

Fetch the most recent existing page from the quarter parent to see the **Plan** section. Progress this week should reflect it.

### 3. Gather data (run in parallel)

**GitHub — PRs opened/merged:**
```bash
gh search prs --author=bhingston-va --created="MON..FRI" --limit 20
gh search prs --author=bhingston-va --merged="MON..FRI" --limit 20
```

**GitHub — PRs reviewed:**
```bash
gh search prs --reviewed-by=bhingston-va --updated="MON..FRI" --limit 20
```

**Git commits** — check repos and worktrees most likely to be active. Key repos under `/Users/bhingston/Projects`:
- `crm-integrations`, `all-mail`, `MS`, `SM`
- Any `galaxy*` directory
- Any directory containing an active worktree (`git worktree list`)

```bash
git -C <repo> log --author="bhingston\|Benj" --after="YYYY-MM-DD" --before="YYYY-MM-DD" \
  --format="%ad %s" --date=short 2>/dev/null
```

Only report repos that have activity — skip empty ones.

**GChat** — check for cached messages first:
```bash
ls ~/.claude/fetcher/google-chat/
```
If cached space directories exist, read their `messages.md` files for the week. To fetch fresh messages from a known space URL:
```bash
python3 ~/.claude/plugins/cache/vendasta-dev-agent-toolkit/vendasta-dev-agent-toolkit/0.12.0/scripts/fetch_chat.py fetch <space-url>
```
GChat often surfaces decisions, design discussions, and cross-team context not visible in code — prioritise it.

### 4. Questionnaire

Ask the user about contributions not captured in the above sources. Keep it conversational — these are prompts, not a rigid form:

1. **Meetings / decisions** — Any meetings or discussions this week that led to a notable decision, changed direction, or unblocked something?
2. **Cross-team or stakeholder work** — Any collaboration outside the immediate team (other squads, PMs, stakeholders)?
3. **Helping teammates** — Significant mentoring, pairing, or unblocking beyond formal PR reviews?
4. **Problems / blockers** — Anything stuck that needs help from others (for the Problems section)?
5. **Next week priorities** — Top 2–4 things you're planning for next week?

### 5. Synthesise and write the page

Combine data from GitHub, GChat, git, and questionnaire answers into concise PPP content.

Guidelines:
- **Less is more.** Only notable achievements — not a ticket dump.
- **Progress** should reflect what was in last week's Plan. Focus on things at or above senior-dev level: shipped features, architectural decisions, cross-team impact, unblocking others.
- Don't just echo ticket titles — capture *what mattered and why*.
- **Plan**: top 2–4 priorities derived from in-progress work and questionnaire answers.
- **Problems**: only genuine blockers needing help from others. Leave blank if none.
- **No boilerplate** — do not include the instructions/filler that lives in the page template.

Page structure:
```
**Progress**

* <item>

‌

**Plan**

* <item>

‌

**Problems**

* <item or blank>
```

### 6. Create the page

Use the Confluence MCP `createConfluencePage`:

```
cloudId:       77fcf126-19b9-4276-9a8f-9d9fa1efe60f
spaceId:       1518010429
parentId:      <quarter parent page ID>
title:         <derived title>
contentFormat: markdown
body:          <filled PPP content>
```

Return the page URL when done.

## Notes

- Always verify the Friday date arithmetic — don't guess.
- Week numbers can skip (vacation); always derive K from the last existing page, not by counting weeks from quarter start.
- After creating the page, remind the user to drag it to the top of the parent in the Confluence sidebar (newest first) — the API cannot reorder pages.
