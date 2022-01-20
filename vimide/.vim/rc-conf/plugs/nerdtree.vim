" easy open nerd tree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>t :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:NERDTreeDirArrowExpandable = 'ᗒ'
"let g:NERDTreeDirArrowCollapsible = 'ᗐ'
"let g:NERDTreeDirArrowExpandable = '⍄'
"let g:NERDTreeDirArrowCollapsible = '⍌'
let g:NERDTreeDirArrowExpandable = 'ᐅ'
let g:NERDTreeDirArrowCollapsible = 'ᐁ'
"let g:NERDTreeDirArrowExpandable = 'ᐳ'
"let g:NERDTreeDirArrowCollapsible = 'ᐯ'
