let g:fugitive_dynamic_colors = 1

" better git diff aliasses
" `-` for horizontal 3way split
" `\` for vertical 3way split
nnoremap <leader>gd- :Gdiff!<CR>
nnoremap <leader>gd\ :Gvdiff!<CR>
nnoremap <leader>gd :Gdiff<CR>
