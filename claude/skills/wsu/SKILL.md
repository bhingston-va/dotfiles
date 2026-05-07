---
name: wsu
description: Create and fill a new Weekly Status Update (WSU) Confluence page. Use when the user wants to create a new WSU or update the current week's status. Gathers data from GitHub, GChat, and git commits, then runs a short questionnaire for contributions not visible in tooling.
---

# Weekly Status Update (WSU)

Creates or fills a WSU page for the current week. Gathers data from multiple sources, runs a questionnaire for off-system contributions, and writes the page.

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

### 1. Determine the title and target page

1. Get today's date and compute the Friday of the current ISO work week.
2. Derive the quarter from the month.
3. List children of the quarter parent page (ordered by `created DESC`) and read the last K used — increment by 1.
4. Construct the title: `Benj Hingston - YYYY-MM-DD QJWK`
5. **Check if the page already exists** (it may have been pre-created). If so, use `updateConfluencePage`. If not, use `createConfluencePage` at the end.

### 2. Read the previous week's WSU

Fetch the most recent existing page to see the **Plan** section. Progress this week should reflect it.

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

**Git commits** — lead with worktrees, which is where active work lives:
```bash
# Find all active worktrees across key repos
git -C /Users/bhingston/Projects/crm-integrations worktree list 2>/dev/null
git -C /Users/bhingston/Projects/all-mail worktree list 2>/dev/null
# Check any galaxy* directories found under /Users/bhingston/Projects
```
Then for each worktree path found, run:
```bash
git -C <worktree-path> log --author="bhingston\|Benj" --after="YYYY-MM-DD" --before="YYYY-MM-DD" \
  --format="%ad %s" --date=short 2>/dev/null
```
Also check base repos directly (commits on master). Skip anything with zero output.

**GChat** — check for cached messages first:
```bash
ls ~/.claude/fetcher/google-chat/
```
GChat is often not cached. If the cache is empty, ask the user: *"Any GChat spaces worth checking? (team channel, specific threads?)"* and fetch with:
```bash
python3 ~/.claude/plugins/cache/vendasta-dev-agent-toolkit/vendasta-dev-agent-toolkit/0.12.0/scripts/fetch_chat.py fetch <space-url>
```
GChat often surfaces decisions and cross-team context not visible in code — worth the effort to fetch.

### 4. Questionnaire

Ask these conversationally — not as a rigid form. The goal is to surface contributions that don't show up in GitHub or git.

1. **Meetings** — Any meetings this week that led to a notable decision, changed direction, or unblocked something? *If yes: did you initiate the meeting, or were you pulled in?*
2. **Cross-team / stakeholder** — Any collaboration outside the immediate team (other squads, PMs, staff eng, other programs)?
3. **Helping teammates** — Significant mentoring, pairing, or unblocking beyond formal PR reviews?
4. **Blockers** — Anything stuck that needs help from others (for Problems section)?
5. **Next week** — Top 2–4 priorities?

### 5. Synthesise and write

Combine GitHub, GChat, git, and questionnaire answers into concise PPP content.

**Writing guidelines:**
- **Less is more.** Notable achievements only — not a ticket dump.
- **Progress** should reflect last week's Plan. Focus on senior-dev-level signals: shipped features, validated technical hypotheses before building, architectural decisions, cross-team impact, unblocking others.
- **Proactivity matters.** If Benj initiated a meeting, reached out to another team, or flagged a problem unprompted — write it that way. "Reached out to…" and "Initiated a conversation with…" read very differently from "consulted by" or "met with." Don't flatten that signal.
- Don't echo ticket titles — capture *what mattered and why*.
- **Plan**: top 2–4 priorities from in-progress work and questionnaire.
- **Problems**: only genuine blockers needing outside help. Leave blank if none.
- **No boilerplate** — no instructions or filler text in the page body.

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

### 6. Create or update the page

**If the page already exists** (found in step 1):
```
updateConfluencePage:
  cloudId:       77fcf126-19b9-4276-9a8f-9d9fa1efe60f
  pageId:        <existing page ID>
  contentFormat: markdown
  body:          <filled PPP content>
```

**If the page does not exist:**
```
createConfluencePage:
  cloudId:       77fcf126-19b9-4276-9a8f-9d9fa1efe60f
  spaceId:       1518010429
  parentId:      <quarter parent page ID>
  title:         <derived title>
  contentFormat: markdown
  body:          <filled PPP content>
```

Return the page URL. If the page was newly created, remind the user to drag it to the top of the parent in the Confluence sidebar — the API cannot reorder pages.

## Notes

- Always verify the Friday date arithmetic — don't guess.
- Week numbers can skip (vacation); always derive K from the last existing page, not by counting from quarter start.
- The spaceId must be a numeric Long (`1518010429`), not the space key (`~106705950`) — the API rejects the key.
