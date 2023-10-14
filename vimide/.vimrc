" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/vimide/.vim/plugged')

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-rhubarb'
" csapprox is a peer dep of fugitive Git blame
Plug 'godlygeek/csapprox'

" Status | tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'

" Buffer navigation | Session management
Plug 'szw/vim-maximizer'
Plug 'ThePrimeagen/harpoon'
" plenary is a peer dep of harpoon
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-obsession'

" General go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tag support
Plug 'craigemery/vim-autotag'

" Search | Code highlight
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'justinmk/vim-sneak'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/limelight.vim'

" Comments
Plug 'tpope/vim-commentary'

" Autocomplete | LSP installer | AI helper
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"Plug 'gelguy/wilder.nvim'

" Debugging
Plug 'puremourning/vimspector'

" Code time tracking
Plug 'wakatime/vim-wakatime'

call plug#end()
" }}}

:set encoding=utf-8

" [ WildMenu - wilder.nvim ] {{{
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"so ~/dotfiles/vimide/.vim/rc-conf/plugs/wilder.vim
" }}}

" see .vim/plugin/my-conf.vim for configuration
