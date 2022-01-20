" Custom search commands
" unmerged files: `vim $(git diff --name-only --diff-filter=U)` in commandline
command! GFilesConflicted call fzf#run(fzf#wrap({'source': 'git diff --name-only --diff-filter=U'}))
nnoremap <silent> <leader>g :GFilesConflicted<CR>
" recent files?
nnoremap <silent> <leader>r :FZFMru<CR>
" files in git repo with changes
nnoremap <silent> <leader>j :GFiles?<CR>
" files in git repo
nnoremap <silent> <leader>f :GFiles<CR>
" files in history
nnoremap <silent> <leader>h :History<CR>
" Jump to the existing buffer if possible
let g:fzf_buffers_jump = 1

" popups
let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Comment'} }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
