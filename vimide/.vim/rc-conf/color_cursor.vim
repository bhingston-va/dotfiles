" Search
hi Search cterm=bold ctermbg=none ctermfg=167 gui=bold guibg=none guifg=#d75f5f
hi IncSearch cterm=bold ctermbg=233 gui=bold guibg=#121212

" [ Highlight cursor (plus row and column on request) ] {{{

"" Toggle cursor row highlighting on request...
"nmap <silent> :r [Toggle cursor line highlighting] :set cursorline!<CR>
"" Toggle cursor column highlighting on request...
"nmap <silent> :c [Toggle cursor row highlighting] :silent call Toggle_CursorColumn('flip')<CR>
"" Implement cursor toggle...
"let g:cursorcolumn_visible = 0
"function! Toggle_CursorColumn (requested_state)
"  if a:requested_state == 'off' || g:cursorcolumn_visible && a:requested_state == 'flip'
"    let g:cursorcolumn_visible = 0
"    hi clear CursorColumn
"    hi CursorColumn term=none cterm=none gui=none
"  else
"    let g:cursorcolumn_visible = 1
"    hi CursorColumn term=bold ctermfg=black ctermbg=cyan cterm=bold gui=bold guifg=#000000 guibg=#008080
"  endif
"endfunction
"
"" Inverse highlighting for cursor...
"hi CursorInverse term=inverse ctermfg=black ctermbg=cyan gui=inverse guifg=#000000 guibg=#008080
"call matchadd('CursorInverse', '\%#', 100)
"" Need an invisible cursor column to make it update on every cursor move...
"hi clear CursorColumn
"hi CursorColumn term=none cterm=none ctermbg=232 gui=none guibg=#080808
"set cursorcolumn
" }}}

" [ Config CursorLine & Background ] {{{
set cursorline
hi CursorLine   cterm=NONE ctermbg=233 gui=none guibg=#121212
hi CursorColumn cterm=NONE ctermbg=232 gui=none guibg=#080808
nnoremap <Leader>c :set cursorcolumn!<CR>
" }}}
