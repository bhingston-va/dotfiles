" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/vimide/.vim/plugged')

" Git integration
Plug 'airblade/vim-gitgutter'

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree'

" General go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tag support
Plug 'craigemery/vim-autotag'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}

:set encoding=utf-8

" see .vim/plugin/my-conf.vim for configuration
