---
name: temporal-activities
description: Design and implement Temporal activities. Use when defining activity params/results, adding new activities, or when the user mentions activity types, activity serialization, or activity visibility.
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
---

# Temporal activities

Guidance for defining and implementing Temporal activities.

## Activity param and result types

**Rule:** Activity params and result **structs** are **package-private** (unexported). Their **fields** are **exported** so Temporal can serialize them.

- **Unexported struct:** e.g. `createReplyEventActivityParams`, `fetchReplyAndParentResult` — not visible outside the workflow package.
- **Exported fields:** e.g. `Namespace`, `EventID`, `Subscription` — required for JSON/serialization across workflow and activity boundaries.

```go
// ✅ Correct
type createReplyEventActivityParams struct {
	Namespace             string
	ParentMessageID       string
	ReplyTrackedMessageID string
}

type createReplyEventActivityResults struct {
	EventID string
}

// ❌ Avoid: exported param/result types (no need for external callers)
type CreateReplyEventActivityParams struct {
	Namespace string
}
```

Tests in the same package can still construct and use these types. Only the workflow and its activities need to reference them.

## Other activity practices

- **One-write rule:** Activities without heartbeats should have at most one write; split multi-write activities.
- **Minimal data:** Pass IDs between activities when possible; keep result structs minimal.
- **No sensitive data:** Never put tokens or credentials in params or results.

If the repo has temporal-workflows or temporal-testing skills, use those for workflow structure, one-write details, and testing patterns.

## Checklist

When adding or changing activity params or results:

- [ ] Param/result struct names are unexported (lowercase).
- [ ] All fields used in serialization are exported (capitalized).
- [ ] No sensitive data (tokens, credentials) in params or results.
