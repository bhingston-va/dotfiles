" [ Set up smarter search behaviour ] {{{
set incsearch   "Lookahead as search pattern is specified
set ignorecase  "Ignore case in all searches...
set smartcase   " ...unless uppercase letters used
set hlsearch    "Highlight all matches
set magic

" Disable highlight with <tab>
nnoremap <silent> <tab> :nohl<cr>
" Center found words on screen
nnoremap N Nzz
nnoremap n nzz

" Show syntax highlighting groups for word under cursor
nnoremap <CS-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo remap(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

noremap <C-p> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

for id in synstack(line("."), col("."))
   echo synIDattr(id, "name")
endfor
" }}}
