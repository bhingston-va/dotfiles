let g:fugitive_dynamic_colors = 1

" better git diff aliasses
" `-` for horizontal 3way split
" `\` for vertical 3way split
nnoremap <leader>gd- :Gdiff!<CR>
nnoremap <leader>gd\ :Gvdiff!<CR>
nnoremap <leader>gd :Gdiff<CR>

" merge conflicts
" get from target (target branch is the branch that receives the changes)
nnoremap <leader>gdt :diffget //2<CR>
" get from merge (source branch is the branch whose changes are merged into target branch)
nnoremap <leader>gdm :diffget //3<CR>
" get from both (includes changes from both source branch and target branch)
nnoremap <leader>gdb :diffget<CR>
" }}}

