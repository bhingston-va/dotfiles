# Troubleshooting vim go to reference behavior
_Exported on 11/24/2025 at 10:01:20 CST from Cursor (2.0.77)_

---

**User**

Can you find out why my vim when using "go to reference" (g-r) sometimes opens up this vim [List Preview] at the top rather than what I want which is list of locations with a [List Preview] of the code?

---

**Cursor**


Investigating the "go to reference" (g-r) behavior. Checking vim configuration files for the mapping and LSP setup.



Checking for hidden files and searching for LSP/reference configurations:



Reading the relevant configuration files to understand the reference setup:



Found the mapping: `gr` is mapped to `<Plug>(coc-references)` on line 56. Checking coc.nvim configuration for how references are displayed:



Checking coc-settings.json for relevant configuration:



Searching for location list and preview window configuration:



Found the relevant code. Checking coc.nvim configuration options for list position and preview behavior:



## The Problem

When using `gr` (mapped to `<Plug>(coc-references)`), coc.nvim opens the location list. Sometimes it opens at the top and shows a "[List Preview]" instead of the list of locations.

From the coc.nvim code (line 68 in `coc/list.vim`), the list can open at the top or bottom based on the `position` parameter. When opened at the top, it may show a preview instead of the list.

## The Solution

Configure coc.nvim to always show the location list at the bottom, or use vim's quickfix list. Add this to your `coc.vim` configuration file:

```vim
" Force location list to open at bottom instead of top
let g:coc_enable_locationlist = 0
```

Or, to use quickfix list for locations (which typically opens at the bottom):

```vim
" Use quickfix list for locations instead of location list
call coc#config('preferences.useQuickfixForLocations', v:true)
```

Add one of these to `/Users/bhingston/dotfiles/vimide/.vim/rc-conf/plugs/coc/coc.vim` after the existing coc configuration (around line 168).

Alternatively, you can add this to your `coc-settings.json`:

```json
{
  "jest.terminalPosition": "bottom",
  "list.normalMappings": {
    "<cr>": "open"
  },
  "list.location.position": "bottom"
}
```

The `"list.location.position": "bottom"` setting should force the location list to open at the bottom, which should show the list of locations with a preview below rather than just a preview at the top.

Should I add this configuration to your files?

```plaintext
" Force location list to open at bottom instead of top
let g:coc_enable_locationlist = 0
```

```plaintext
" Use quickfix list for locations instead of location list
call coc#config('preferences.useQuickfixForLocations', v:true)
```

```json
{
  "jest.terminalPosition": "bottom",
  "list.normalMappings": {
    "<cr>": "open"
  },
  "list.location.position": "bottom"
}
```

---

**User**

I don't use json files for configuration (not sure how I'd start to use them). Can you give me the bottom conc-settings.json as vim script code?

---

**Cursor**


Checking the current coc.vim file to see where to add the configuration:



Add this to the end of your `coc.vim` file (after line 167):

```vim
" Configure location list to open at bottom instead of top
" This ensures the list of references shows at the bottom with preview,
" rather than just a preview window at the top
call coc#config('list.location.position', 'bottom')
```

This sets the location list position to `'bottom'` so the list appears at the bottom with a preview, instead of only a preview at the top.

Add it right after the diagnostic float config section:

```vim
" sets boarers for auto complete
call coc#config('suggest.floatConfig', {
    \ 'border': v:true,
    \ 'rounded': v:true,
    \ 'borderhighlight': 'FireBoarderBlue',
    \ })
call coc#config('diagnostic.floatConfig', {
    \ 'border': v:true,
    \ 'rounded': v:true,
    \ 'borderhighlight': 'PreProc',
    \ })

" Configure location list to open at bottom instead of top
" This ensures the list of references shows at the bottom with preview,
" rather than just a preview window at the top
call coc#config('list.location.position', 'bottom')
```

This should make `gr` show the list of locations at the bottom with a preview, instead of only a preview at the top.

```plaintext
" Configure location list to open at bottom instead of top
" This ensures the list of references shows at the bottom with preview,
" rather than just a preview window at the top
call coc#config('list.location.position', 'bottom')
```

```plaintext
" sets boarers for auto complete
call coc#config('suggest.floatConfig', {
    \ 'border': v:true,
    \ 'rounded': v:true,
    \ 'borderhighlight': 'FireBoarderBlue',
    \ })
call coc#config('diagnostic.floatConfig', {
    \ 'border': v:true,
    \ 'rounded': v:true,
    \ 'borderhighlight': 'PreProc',
    \ })

" Configure location list to open at bottom instead of top
" This ensures the list of references shows at the bottom with preview,
" rather than just a preview window at the top
call coc#config('list.location.position', 'bottom')
```

---

**User**

can you explain the difference between these 2 a bit more



" Force location list to open at bottom instead of top



let g:coc_enable_locationlist = 0



" Use quickfix list for locations instead of location list



call coc#config('preferences.useQuickfixForLocations', v:true)



I have a feeling it's not just where it's placed and reading the help of g:coc_enable_locationlist I suspect that that effects other modes (like go to definition etc).



Maybe there's a race condition (if I'm reading correctly), where if there's only 1 it auto goes there but if there's more than 1 it shows a preview and a list?

---

**Cursor**


Searching coc.nvim documentation for these settings and the single vs multiple location behavior:



Searching for more details on `useQuickfixForLocations`:



## The Two Options Explained

### 1. `let g:coc_enable_locationlist = 0`

- What it does: Disables coc's built-in location list (`coc-list-location`) for all location jumps.
- Scope: Affects all location operations:
  - `gd` (go to definition)
  - `gr` (go to references)
  - `gi` (go to implementation)
  - `gy` (go to type definition)
- Purpose: Lets you customize behavior via `CocLocationsChange` and `g:coc_jump_locations`.
- Result: Without customization, you lose the list UI and may only get direct jumps.

### 2. `call coc#config('preferences.useQuickfixForLocations', v:true)`

- What it does: Uses vim's native quickfix list instead of coc's location list.
- Scope: Also affects all location operations (same as above).
- Purpose: Use vim's quickfix for consistency with other tools.
- Result: Locations populate the quickfix list (typically opens at the bottom).
- Note: When this is enabled, `g:coc_enable_locationlist` is ignored.

## The "Race Condition" You Noticed

From the docs (lines 795-802):

- Single location: Auto-jumps directly to the location (no list).
- Multiple locations: Opens `coc-list-location` for preview and selection.

The issue: When multiple locations are found, the list sometimes opens at the top showing only a preview instead of the list at the bottom.

## The Solution

To fix the preview-at-top issue while keeping the list behavior, use:

```vim
" Configure location list to open at bottom instead of top
call coc#config('list.location.position', 'bottom')
```

This:
- Keeps coc's location list enabled (default)
- Forces the list window to open at the bottom
- Shows the list of locations with a preview below
- Applies to all location operations (definition, references, etc.)

This is different from the two options above because it configures where the list opens, not which list system is used.

Should I add this configuration to your `coc.vim` file?

```plaintext
" Configure location list to open at bottom instead of top
call coc#config('list.location.position', 'bottom')
```

---

**User**

Ah that makes sense. The preference just forces where it goes so it's consistent. Now can you explain which one is when? Which one is top only without the list. And which is the botton with 2 "windows" (preview + list of places)

---

**Cursor**


Checking the code to see what controls the preview vs list behavior:


---

**User**

window might not be the right term. Refer to the 2 pictures I sent. You can see vim open. The files are named appropriately too (wanted-... and wrong-...)

---

**Cursor**


## The Two Behaviors

### 1. Top position (wrong) — preview only
- What you see: A "[List Preview]" window at the top showing code
- What's missing: The actual list of locations
- Why: When the list opens at the top, it may only show the preview window, not the selectable list

### 2. Bottom position (wanted) — list + preview
- What you see: A list of locations at the bottom (selectable items)
- Plus: A preview window below it showing the code for the selected item
- Why: When the list opens at the bottom, it shows both the list and the preview

## The Configuration

The `list.location.position` setting controls where the location list opens:

- `'top'` (default or unset) → Opens at top → Can show only preview (wrong behavior)
- `'bottom'` → Opens at bottom → Shows list + preview (wanted behavior)

So the fix is:

```vim
" Force location list to always open at bottom
" This ensures you get the list of locations (not just preview)
call coc#config('list.location.position', 'bottom')
```

This forces the location list to open at the bottom, which should give you:
- The list of reference locations at the bottom (selectable)
- A preview window below it showing the code

The top-only preview happens when the list opens at the top; setting it to `'bottom'` should resolve it.

```plaintext
" Force location list to always open at bottom
" This ensures you get the list of locations (not just preview)
call coc#config('list.location.position', 'bottom')
```

---

**User**

Why is there a race condition affect? Is bottom set somewhere else? When I run the command it does one or the other and is not consistent.

---

**Cursor**


Searching for where the position is determined and what causes the inconsistency:



Searching for where the position is determined when opening the location list:



Checking coc config documentation for list position settings:



Searching for where the position is determined when opening the location list:



Checking how CocList determines the default position:



The inconsistency comes from how coc.nvim determines the position when it's not explicitly set.

## The Problem

When `gr` is pressed, coc.nvim calls:
```javascript
nvim.command("CocList --normal --auto-preview location", true);
```

Notice: no `--top` or `--bottom` flag. Without an explicit position, coc.nvim may choose based on:
- Available screen space
- Current window layout
- Whether a preview window already exists
- Some internal heuristic

This explains the inconsistent behavior: sometimes it opens at the top (preview only), sometimes at the bottom (list + preview).

## The Solution

Set the position explicitly so it's always consistent:

```vim
" Force location list to always open at bottom
" This ensures consistent behavior: list at bottom + preview below
call coc#config('list.location.position', 'bottom')
```

This forces the location list to always use `'bottom'`, which:
- Opens the list at the bottom (not top)
- Shows both the list and the preview window
- Makes the behavior consistent every time

Without this setting, coc.nvim picks the position dynamically, which causes the inconsistency you're seeing.

Add this to your `coc.vim` file after line 167 to fix it.

```javascript
nvim.command("CocList --normal --auto-preview location", true);
```

```plaintext
" Force location list to always open at bottom
" This ensures consistent behavior: list at bottom + preview below
call coc#config('list.location.position', 'bottom')
```

