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
" plenary is a peer dep of harpoon
Plug 'ThePrimeagen/harpoon' | Plug 'nvim-lua/plenary.nvim'
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

" Autocomplete | LSP installer | Spellcheck
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"Plug 'gelguy/wilder.nvim'
" vim-spellcheck requires vim-ingo-library
Plug 'inkarkat/vim-spellcheck' | Plug 'inkarkat/vim-ingo-library'

" AI helpers
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'github/copilot.vim'
" plenary for curl, log and async functions
Plug 'CopilotC-Nvim/CopilotChat.nvim' | Plug 'nvim-lua/plenary.nvim'


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

" [ CopilotChat ] {{{
lua << EOF
require("CopilotChat").setup {
  -- See Configuration section for options
  question_header = ' :benj: ', -- Header to use for user questions
  answer_header = ' skynet ', -- Header to use for AI answers
  error_header = ' whoops! ', -- Header to use for errors
  separator = '───', -- Separator to use in chat -- https://github.com/copilotc-nvim/copilotchat.nvim?tab=readme-ov-file#configuration
    -- default window options

  window = {
    layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
    width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    height = vim.o.lines - 6, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    border = 'rounded', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = 1, -- row position of the window, default is centered
    col = math.floor(vim.o.columns / 2), -- column position of the window, default is centered
    title = ' 󱜸 Lets talk... ', -- title of chat window
    --footer = nil, -- footer of chat window
    --zindex = 1, -- determines if window is on top or below other floating windows
  },
}
EOF
" }}}

" [ WildMenu - wilder.nvim ] {{{
" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"so ~/dotfiles/vimide/.vim/rc-conf/plugs/wilder.vim
" }}}

" see .vim/plugin/my-conf.vim for configuration
