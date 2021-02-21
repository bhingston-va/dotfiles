" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/vimide/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'craigemery/vim-autotag'
call plug#end()
" }}}

:set encoding=utf-8
