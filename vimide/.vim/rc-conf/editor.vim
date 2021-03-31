" [ Toggle visibility of naughty characters ] {{{
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
set lcs=tab:»»,trail:·,nbsp:~

augroup VisibleNaughtiness
  autocmd!
  autocmd BufEnter  * set list
  autocmd BufEnter  * if !&modifiable
  autocmd BufEnter  *   set nolist
  autocmd BufEnter  * endif
augroup END
hi Whitespace cterm=NONE ctermfg=darkgray gui=none guifg=#252525
" }}}

" [ Miscellaneous features (mainly options) ] {{{
set title         "Show filename in titlebar of window
set titleold=
set scrolloff=5   "Scroll when 5 lines from top/bottom

nnoremap <Space> <nop>
let mapleader= " "

" Toggles between relative number and numbered line
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
"nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set relativenumber

" sets the split bewteen windows to be grey
hi VertSplit ctermfg=244 ctermbg=232 cterm=none guifg=#808080 guibg=#080808 gui=none

" Pressing <leader>ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>
" Toggle paste mode on and off
imap <leader>pp <Esc>:setlocal paste!<cr>i
noremap <leader>pp :setlocal paste!<cr>
" }}}

" [ Set up Indentation with Spaces & Tabs ] {{{
set ruler
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
set autoindent     "Auto indents next line to the prevous line

augroup TabWidth
  autocmd!
  autocmd BufEnter *.scss set tabstop=2
  autocmd BufEnter *.scss set shiftwidth=2
  autocmd BufEnter *.css  set tabstop=2
  autocmd BufEnter *.css  set shiftwidth=2
  autocmd BufEnter *.html set tabstop=2
  autocmd BufEnter *.html set shiftwidth=2
  autocmd BufEnter *.ts   set tabstop=2
  autocmd BufEnter *.ts   set shiftwidth=2
  autocmd BufEnter *.js   set tabstop=2
  autocmd BufEnter *.js   set shiftwidth=2
  autocmd BufEnter *.tex  set tabstop=2
  autocmd BufEnter *.tex  set shiftwidth=2
augroup END

augroup TabExpandage
  autocmd!
  autocmd BufEnter  *.hs    ret
  autocmd BufEnter  *.hs    set expandtab
  autocmd BufEnter  *.sh    set expandtab
  autocmd BufEnter  *.scss  set expandtab
  autocmd BufEnter  *.css   set expandtab
  autocmd BufEnter  *.html  set expandtab
  autocmd BufEnter  *.ts    set expandtab
  autocmd BufEnter  *.js    set expandtab
  autocmd BufEnter  *.tex   set expandtab
augroup END
" }}}
