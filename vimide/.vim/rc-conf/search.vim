" [ Set up smarter search behaviour ] {{{
set incsearch   "Lookahead as search pattern is specified
set ignorecase  "Ignore case in all searches...
set smartcase   " ...unless uppercase letters used
set hlsearch    "Highlight all matches
set magic

" Disable highlight
nnoremap <silent> <c-e> :nohl<cr>
" Center found words on screen
nnoremap N Nzz
nnoremap n nzz
" }}}
