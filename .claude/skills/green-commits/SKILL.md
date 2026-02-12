---
name: green-commits
description: When completing a plan, task, or job, commit and push to a feature branch by default—the user should not have to ask. Never commit or push to master. Use small, green commits. If unsure whether to commit/push, ask. Defines "green" as full-repo build, tests, and lint passing.
---

# Committing and pushing completed work

Use this skill when you have **finished a plan, task, or job** that produced code changes. It is about **default behavior**: the user should **not** have to tell you to commit and push. You should do it, following the rules below. If you're unsure whether they want this work committed and pushed, ask.

## Default behavior

When you complete work (a plan, task, or multi-step job) that results in changes:

- **Commit and push to a feature branch** without being asked.
- Do **not** wait for the user to say "commit and push" or "push."

If it's ambiguous whether the work is "done" or whether they want it committed (e.g. exploratory or WIP), **ask**: e.g. "Should I commit and push this to the current branch?"

## Rules when committing and pushing

### 1. Never commit or push to master

- **Never** run `git push origin master` (or equivalent main branch).
- Only commit and push to **feature branches** (e.g. the branch the user is already on, or a branch they asked for).
- If the current branch is `master` or `main`, switch to a feature branch first or ask which branch to use before pushing.

### 2. Small and green commits

- **Small**: Prefer multiple logical commits (e.g. one per coherent change) rather than one big dump. Makes history and revert easier.
- **Green**: Each commit (and the push) must be **green**. See "What green means" below.

### 3. Ask if unsure

- If you're not sure the user wants this work committed and pushed (e.g. they said "just explore" or "draft only"), ask: "Do you want me to commit and push this to \<branch\>?"

## What "green" means

**Green** = the **full repository** passes:

1. **Build** – e.g. `go build ./...` (often implied when running tests or lint).
2. **Tests** – full test suite (e.g. `go test ./...` or whatever the repo/CI uses).
3. **Lint** – the repo’s linter (e.g. golangci-lint, `go vet`, or project-specific). Same bar as CI.

You don't need to run full CI; running build, tests, and lint locally is enough. Don't commit or push until the repo is green (or the user explicitly accepts otherwise).

**Scope:** The **entire repo** must pass. If the repo has pre-existing failures elsewhere, the push is not green until those are fixed or the user says to proceed anyway.

**Rare case – master is broken:** If the main branch itself doesn't pass, that’s usually a separate fix (own PR, coordination with others). Don’t block indefinitely; note it and let the user decide.

## Example flow

```bash
# After completing work, before committing:
go build ./...
go test ./... -count=1
# Run repo linter (e.g. golangci-lint, make lint, or go vet ./...)

# If all pass, small commits to current (feature) branch:
git add <files>
git commit -m "short message"
# Repeat for next logical chunk if needed, re-running tests/lint as needed.

# Push to the feature branch only (never master):
git push origin <feature-branch>
```

## Audience

This skill is for the **AI only** – default instructions for when and how to commit and push after completing work.
