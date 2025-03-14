" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/vimide/.vim/plugged')

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
" csapprox is a peer dep of fugitive Git blame
Plug 'tpope/vim-rhubarb' | Plug 'godlygeek/csapprox'
Plug 'rhysd/git-messenger.vim'

" Status | tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
" requires code-minimap `brew install code-minimap`
Plug 'wfxr/minimap.vim'

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
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mistricky/codesnap.nvim', { 'do': 'make' }

" Comments
Plug 'tpope/vim-commentary'

" Autocomplete | LSP installer | AI helper | Spellcheck
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
" Plug 'github/copilot.vim'
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"Plug 'gelguy/wilder.nvim'
" vim-spellcheck requires vim-ingo-library
Plug 'inkarkat/vim-spellcheck' | Plug 'inkarkat/vim-ingo-library'

" Debugging
Plug 'puremourning/vimspector'

" Code time tracking
Plug 'wakatime/vim-wakatime'

" Welcome splash screen | key bindings
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'

" cURL | REST | HTTP
Plug 'diepm/vim-rest-console'

call plug#end()
" }}}

:set encoding=utf-8

" [ WildMenu - wilder.nvim ] {{{
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"so ~/dotfiles/vimide/.vim/rc-conf/plugs/wilder.vim
" }}}

" see .vim/plugin/my-conf.vim for configuration
