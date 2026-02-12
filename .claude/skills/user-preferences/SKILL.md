---
name: user-preferences
description: When editing Go code, match the project's existing struct/map/comment alignment (align type column, value column) so the user's editor (e.g. vim/vim-go) does not rewrite changes on save. Apply in all repos.
---

# User preferences (personal, all repos)

**Location:** ~/.claude/skills/user-preferences/. For all personal skills, see ~/.claude/skills/README.md.

Apply these preferences when editing code so the result matches the user's editor/formatting setup.

## Go formatting (alignment)

When editing Go, match existing whitespace so editor-on-save (e.g. vim/vim-go) doesn't rewrite your changes. Use alignment within logical blocks:

- **Struct field definitions**: Within each struct, align the type column (spaces between field name and type so all types in that struct start at the same column). Inline comments after fields follow the same alignment.
- **Struct composite literals**: Within each composite literal, align the value column (spaces between field name and value so all values in that literal start at the same column).
- **Map literals**: Within each map literal block, align the value column (after `"key":` use spaces so all values in that map start at the same column). Nested maps each have their own alignment within their block.
- **Imports**: Keep existing grouping and one-import-per-line; no need to align import paths.
- When adding or changing a field in an existing struct/map/literal, preserve and extend the existing alignment of that block; do not collapse to single-space or gofmt-only style.
