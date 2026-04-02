" Allow Neovim to reload the buffer if the file changes on disk
set autoread

" Triggers the reload immediately when you switch back to a code window
autocmd FocusGained,BufEnter * silent! checktime
