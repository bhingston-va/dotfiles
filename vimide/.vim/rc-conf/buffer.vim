" [ File Editing ] {{{
" Return to last edit position when opening files.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Move block
vnoremap J xp`[V`]
vnoremap K xkP`[V`]

" Delete trailing white space on save, useful for Python and others
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
"  exe "normal `z"
endfunc

:augroup deleteWhitespace
:  autocmd!
:
:  autocmd BufWrite *.sh  :call DeleteTrailingWS()
:  autocmd BufWrite *.hs  :call DeleteTrailingWS()
:  autocmd BufWrite *.cc  :call DeleteTrailingWS()
:  autocmd BufWrite *.c   :call DeleteTrailingWS()
:  autocmd BufWrite *.cpp :call DeleteTrailingWS()
:  autocmd BufWrite *.vim :call DeleteTrailingWS()
:  autocmd BufWrite *.txt :call DeleteTrailingWS()
:  autocmd BufWrite *.md  :call DeleteTrailingWS()
:  autocmd BufWrite *.py  :call DeleteTrailingWS()
:  autocmd BufWrite *.tex :call DeleteTrailingWS()
:  autocmd BufWrite *.go  :call DeleteTrailingWS()
:augroup END

" Don't close window, when deleting a buffer
nnoremap \d :bp<cr>:bd #<cr>
noremap <leader>d :bp<cr>:bd #<cr>
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction
" }}}
