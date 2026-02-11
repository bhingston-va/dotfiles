---
name: vim-rest
description: When creating or editing .rest files for Vim (rest.nvim / vim-rest-console), use this structure: base URL, blank line, global variables, blank line, tkn and Authorization header, then -- and API blocks each starting with --.
---

# Vim .rest file structure

Use this **exact** layout for `.rest` files so they work with rest.nvim (or vim-rest-console) and match the user's preferences.

## Required order (with blank lines)

1. **Base URL** — first line only (e.g. `https://email-api-demo.vendasta-internal.com` or `http://localhost:11001`).

2. **Blank line.**

3. **Global variables** — one per line, `name = value` (no quotes unless the value contains spaces). Include any request-specific variables here (e.g. ids, tokens for env switching).

4. **Blank line.**

5. **Token variable** — `tkn = <jwt-or-token>` (or `demoTkn` / `prodTkn` if you prefer; keep one main token variable).

6. **Blank line.**

7. **Authorization header** — `Authorization: Bearer :tkn` (leading colon references the variable in rest.nvim).

8. **Separator** — `--` (two dashes).

9. **Blank line.**

10. **Each API block** — every request block **starts with** `--` (two dashes) on its own line, then the request (optional base override, method + path, optional headers like Content-Type, optional body). Put a blank line between blocks if you like; the next block always starts with `--`.

**Do not** remove the token variable or the Authorization header. Keep them at the top even if some endpoints in the file are unauthenticated; the user expects this structure and will add/remove APIs as needed.

## Format summary

```
<base URL>

<global var 1>
<global var 2>

tkn = your-token-here

Authorization: Bearer :tkn
--

--
[optional base URL override]
POST /path
[optional Content-Type: application/json]
{ "key": "value" }

--
POST /another-path
{ "key": "value" }
```

## Details

- **Base URL:** Line 1 only. No variable like `@baseUrl`; the first line is the default base for all requests.
- **Variables:** `name = value` (no quotes unless the value contains spaces). Reference in request with `:name`.
- **Auth:** Always include `tkn` (or equivalent) and `Authorization: Bearer :tkn` after the global variables. Do not remove them when editing a file.
- **Separator:** Two dashes `--` after the auth block, then **each API block starts with** `--` on its own line.
- **Optional base override:** Only if this request hits a different host: a single line with the full base URL above the method line.
- **Request line:** Method and path (e.g. `POST /path` or `POST /path?query=value`).
- **Body:** Next line(s) as JSON (indented as you like). Add `Content-Type: application/json` above the body when sending JSON.
- **Comments:** `# comment` above or beside a request is fine.

## Example (minimal)

```
https://email-api-demo.vendasta-internal.com

subscriptionId = some-id
messageId = some-msg-id

tkn = your-jwt-here

Authorization: Bearer :tkn
--

--
POST /tracked-message/delete
Content-Type: application/json
{
  "namespace": "VUNI",
  "tracked_message_id": "TrackedMessage-abc-123"
}

--
http://localhost:11001
POST /tracked-message/delete
Content-Type: application/json
{
  "namespace": "AG-HHV528B6HT",
  "tracked_message_id": "TrackedMessage-xyz-456"
}
```

## When to use

- User asks for a `.rest` file or “vim rest” file.
- User wants API calls for a service and uses Vim with rest.nvim / vim-rest-console.
- User says “how I like to set them up” and has this skill enabled.
