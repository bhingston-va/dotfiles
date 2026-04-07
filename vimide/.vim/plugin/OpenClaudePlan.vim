command! OpenClaudePlan call OpenClaudePlan()

function! OpenClaudePlan()
    " 1. Find the newest markdown file in the Claude plans directory
    " We use 'ls -t' to get the most recent, and 'head -n 1' to grab just one.
    let l:plan_dir = expand('~/.claude/plans/')
    let l:latest_plan = system('ls -t ' . l:plan_dir . '*.md 2>/dev/null | head -n 1 | tr -d "\n"')

    " 2. Safety check: did we actually find a file?
    if empty(l:latest_plan)
        echo "No Claude plans found in " . l:plan_dir
        return
    endif

    " 3. Check if the plan is already open in a window
    let l:plan_win = bufwinnr(l:latest_plan)
    if l:plan_win != -1
        " If it's open, just jump to that window
        execute l:plan_win . 'wincmd w'
    else
        " If not open, create a vertical split on the left (topleft vnew)
        " or just 'vsplit' if you prefer it on the right.
        execute 'topleft vsplit ' . l:latest_plan
    endif

    " 4. Enable "Cursor-style" Live Sync
    " 'autoread' allows the buffer to refresh when the file changes on disk
    setlocal autoread
    " 'nomodified' ensures we don't get 'unsaved changes' warnings while Claude writes
    setlocal nomodified

    " 5. Optional: Use a fast update time for this session so sync feels 'live'
    set updatetime=500

    echo "Watching Claude Plan: " . fnamemodify(l:latest_plan, ':t')
endfunction

" Keybinding: <leader>p for 'Plan'
nnoremap <leader>p :call OpenClaudePlan()<CR>
