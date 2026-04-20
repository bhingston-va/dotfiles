---
name: gcp-ci-watch
description: Watch GCP Cloud Build CI for a branch PR and merge when green. Use when the user wants to monitor CI/CD and auto-merge on success. Prefer this over polling GitHub PR checks — GitHub status lags behind GCP.
---

# Watch GCP CI and Merge on Green

## Why GCP, not GitHub checks

`gh pr status` check statuses lag behind reality and stay `PENDING` long after GCP finishes. Always poll `gcloud builds describe` directly for accurate status.

## Step 1: Get the Cloud Build ID

Extract the build URL from the current PR's check statuses — it contains the Cloud Build ID:

```bash
gh pr status --json number,headRefName,statusCheckRollup \
  --jq '.currentBranch | {pr: .number, checks: [.statusCheckRollup[] | {name: (.context // .name), status: (.state // .conclusion), url: (.targetUrl // .detailsUrl)}]}'
```

Look for the `ci/cloudbuild` check. Its URL looks like:

```
https://console.cloud.google.com/cloud-build/builds;region=us-central1/<BUILD_ID>?project=642433220657
```

Extract the UUID between the last `/` and the `?`.

## Step 2: Monitor the build using the Monitor tool

Use the `Monitor` tool (not a sleep loop in Bash) to poll GCP every 60 seconds:

```
Monitor command:
while true; do
  status=$(gcloud builds describe <BUILD_ID> --project=repcore-prod --region=us-central1 --format="value(status)" 2>/dev/null || echo "ERROR")
  echo "$status"
  case "$status" in
    SUCCESS|FAILURE|CANCELLED|TIMEOUT|INTERNAL_ERROR|ERROR)
      break ;;
  esac
  sleep 60
done
```

Set `persistent: true` so it survives long builds. The monitor will emit one line per poll tick.

## Step 3: On SUCCESS — report, then ask or act based on instructions

**Default: report green and stop.** Do NOT merge unless the user explicitly asked you to merge as part of this task.

> "Build is green ✓ — PR #XXXXX is ready to merge."

**Only merge if the user said something like** "merge when green", "auto-merge", or "merge it when CI passes." In that case, use squash (Galaxy does not allow merge commits):

```bash
gh pr merge <PR_NUMBER> --squash --delete-branch --repo vendasta/galaxy
```

> **Note:** `--delete-branch` can fail with `fatal: '<branch>' is already used by worktree` if you have a local worktree for that branch. The `--repo` flag bypasses local git context and avoids most of these errors. If it still fails, the branch can be deleted manually — the merge itself succeeds.

## Step 4: On FAILURE — report and optionally fix

Always fetch the build log first to understand the failure:

```bash
gcloud builds log <BUILD_ID> --project=repcore-prod --region=us-central1 2>&1 | grep -B 5 -A 5 "ERROR\|Failed tasks"
```

Diagnose the log, fix the code, commit and push, then watch the new build. Repeat until green or you hit a failure you can't resolve — in that case report to the user with context. Do not wait to be asked to fix failures.

## Step 5: After merging

If the user wants the PR marked ready and team notified before merging, use the `pr-ready` skill first. If the PR was already out of draft and CI was the only gate, proceed straight to merge after green.

## Quick reference

| Command | Purpose |
|---------|---------|
| `gcloud builds describe <ID> --project=repcore-prod --region=us-central1 --format="value(status)"` | Poll build status |
| `gcloud builds log <ID> --project=repcore-prod --region=us-central1` | Full build log |
| `gcloud builds list --project=repcore-prod --region=us-central1 --filter="trigger_id=a8be5a85-22ae-494c-94a8-3fed9262a5c8" --limit=5` | Recent branch builds |
| `gh pr merge <NUM> --squash --delete-branch --repo vendasta/galaxy` | Squash merge |

**GCP project:** `repcore-prod`  
**Region:** `us-central1`  
**Branch build trigger ID:** `a8be5a85-22ae-494c-94a8-3fed9262a5c8`  
**E2E build trigger ID:** `9f799af6-1596-483c-bc29-11946cf51ed3`
