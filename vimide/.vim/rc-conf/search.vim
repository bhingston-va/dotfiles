" [ Set up smarter search behaviour ] {{{
set incsearch   "Lookahead as search pattern is specified
set ignorecase  "Ignore case in all searches...
set smartcase   " ...unless uppercase letters used
set hlsearch    "Highlight all matches
set magic

" Disable highlight
nnoremap <silent> <C-0> :nohl<CR>
" Center found words on screen
nnoremap N Nzz
nnoremap n nzz
" }}}
