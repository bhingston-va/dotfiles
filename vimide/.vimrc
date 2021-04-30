" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/vimide/.vim/plugged')

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-rhubarb'
" csapprox is a peer dep of fugitive Git blame
Plug 'godlygeek/csapprox'

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree'

" Buffer navigation
Plug 'szw/vim-maximizer'

" General go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tag support
Plug 'craigemery/vim-autotag'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-sneak'
Plug 'jremmen/vim-ripgrep'

" Comments
Plug 'tpope/vim-commentary'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}

:set encoding=utf-8

" see .vim/plugin/my-conf.vim for configuration
