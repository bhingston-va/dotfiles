" Search
hi Search cterm=bold ctermbg=none ctermfg=167

" [ Highlight cursor (plus row and column on request) ] {{{

" Toggle cursor row highlighting on request...
nmap <silent> :r [Toggle cursor line highlighting] :set cursorline!<CR>
" Toggle cursor column highlighting on request...
nmap <silent> :c [Toggle cursor row highlighting] :silent call Toggle_CursorColumn('flip')<CR>
" Implement cursor toggle...
let g:cursorcolumn_visible = 0
function! Toggle_CursorColumn (requested_state)
  if a:requested_state == 'off' || g:cursorcolumn_visible && a:requested_state == 'flip'
    let g:cursorcolumn_visible = 0
    hi clear CursorColumn
    hi CursorColumn term=none cterm=none
  else
    let g:cursorcolumn_visible = 1
    hi CursorColumn term=bold ctermfg=black ctermbg=cyan cterm=bold
  endif
endfunction

" Inverse highlighting for cursor...
hi CursorInverse term=inverse ctermfg=black ctermbg=cyan
call matchadd('CursorInverse', '\%#', 100)
" Need an invisible cursor column to make it update on every cursor move...
hi clear CursorColumn
hi CursorColumn term=none cterm=none ctermbg=232
set cursorcolumn
" }}}

" [ Config CursorLine & Background ] {{{
set cursorline
hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=232 guibg=darkred guifg=white
nnoremap <Leader>c :set cursorcolumn!<CR>
" }}}
