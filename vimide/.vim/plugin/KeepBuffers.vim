command! -nargs=+ KeepBuffers call KeepBuffers(<f-args>)

" From chatgpt https://chatgpt.com/share/6834b816-9ec0-8000-82a9-008d5c611341
" Example of usage:
" :KeepBuffers 1 3 5
function! KeepBuffers(...)
  let keep = []
  for id in a:000
    call add(keep, str2nr(id))
  endfor

  for b in range(1, bufnr('$'))
    if buflisted(b) && index(keep, b) == -1
      execute 'bdelete' b
    endif
  endfor
endfunction
