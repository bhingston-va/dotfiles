---
name: pr-screenshots
description: Add screenshots or images to a GitHub PR description. Use when taking screenshots for a PR, attaching pictures to PR details, or showing UI changes in a pull request. Images are hosted on a long-lived `pr-screenshots` branch in the same repo because GitHub has no API for drag-and-drop uploads.
---

# PR screenshots

GitHub's drag-and-drop image upload has no API, so host images on an orphan
`pr-screenshots` branch in the PR's own repo and link them.

## Host branch

- Reuse it if it exists: `git ls-remote --heads origin pr-screenshots`.
- Otherwise create it as an **orphan** (no code, outside every PR diff):
  `git worktree add --detach <tmp> origin/<default>`, then `git switch --orphan pr-screenshots`.
- Add images under `<pr-number>/`, commit, push. Never force-push or delete it;
  older PR descriptions point at it.

## Linking

- Pin to the commit, not the branch, so later pushes can't change the picture:
  `https://github.com/<owner>/<repo>/blob/<sha>/<pr>/<file>.png?raw=true`
- Use an `<img>` tag so you can set the width (Retina captures are huge):
  `<img width="600" alt="what it shows" src="…" />`
- Private repo: the images only render for people with repo access, which is
  the point. Don't put them anywhere public (gists) to work around that.

## In the description

Add a `### Screenshots` section just above `### Verify`, leaving Verify empty.
Edit only that section; the user may have hand-edited the rest of the body.
