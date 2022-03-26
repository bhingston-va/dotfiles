" update gutter on post write
autocmd BufWritePost * GitGutter
nnoremap <silent> <leader>b :Git blame --date=relative --color-by-age<CR>
nnoremap <silent> <leader><C-r> :GitGutterFold<CR> :GitGutterLineHighlightsEnable<CR> zr
nnoremap <silent> <leader><C-d> :GitGutterFold<CR> :GitGutterLineHighlightsDisable<CR>
