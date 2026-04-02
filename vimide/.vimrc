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

" AI Agents and tools
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
"Plug 'github/copilot.vim'
" plenary for curl, log and async functions
"Plug 'CopilotC-Nvim/CopilotChat.nvim' | Plug 'nvim-lua/plenary.nvim'
"Plug 'aug6th/cursoragent.nvim' | Plug 'nvim-lua/plenary.nvim'
Plug 'greggh/claude-code.nvim' | Plug 'nvim-lua/plenary.nvim'

" Debugging
Plug 'puremourning/vimspector'

" Code time tracking
Plug 'wakatime/vim-wakatime'

" Welcome splash screen | key bindings
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'

" cURL | REST | HTTP
Plug 'diepm/vim-rest-console'

" Slideshows | Markdown
Plug 'dhruvasagar/vim-marp'
" treesitter is a peer dep of markview
Plug 'OXY2DEV/markview.nvim' | Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
" }}}

:set encoding=utf-8

" [ CursorAgent ] {{{

"lua << EOF
"require("cursoragent").setup({
"  -- Terminal Window Settings
"  terminal = {
"    split_side = "right", -- "left" or "right"
"    split_width_percentage = 0.4, -- Screen ratio (0.0 to 1.0)
"    provider = "auto", -- "auto", "snacks", "native", "external", "none"
"    auto_close = true, -- Close terminal window when process exits
"    show_native_term_exit_tip = true, -- Show tip about Ctrl-\ Ctrl-N
"    git_repo_cwd = true, -- Set CWD to Git root when opening in a Git project
"  },
"
"  -- MCP Server Settings
"  auto_start = true, -- Automatically start MCP server
"  port_range = { min = 10000, max = 65535 },
"  log_level = "info", -- "trace", "debug", "info", "warn", "error"
"
"  -- Selection Tracking
"  track_selection = true, -- Auto-track visual selections
"  focus_after_send = false, -- Focus terminal after sending selection
"  visual_demotion_delay_ms = 50, -- Delay before demoting visual selection
"
"  -- Connection Settings
"  connection_wait_delay = 600, -- Wait time after connection (ms)
"  connection_timeout = 10000, -- Max time to wait for connection (ms)
"  queue_timeout = 5000, -- Max time to keep @ mentions in queue (ms)
"
"  -- Diff Settings
"  diff_opts = {
"    layout = "vertical", -- "vertical" or "horizontal"
"    open_in_new_tab = false, -- Open diff in new tab
"    keep_terminal_focus = false, -- Keep focus in terminal after diff opens
"    hide_terminal_in_new_tab = false, -- Hide terminal in new diff tab
"    on_new_file_reject = "keep_empty", -- "keep_empty" or "close_window"
"  },
"
"  -- Command Settings (optional)
"  terminal_cmd = nil, -- Use default "cursor-agent" or specify custom path
"  env = {}, -- Custom environment variables
"
"  -- Command variants (for backward compatibility)
"  command_variants = {
"    agent = "agent",
"    ask = "ask",
"    plan = "plan",
"    resume = "--resume",
"  },
"})
"EOF

" }}}

" [ CopilotChat ] {{{

"lua << EOF
"require("CopilotChat").setup {
"  -- See Configuration section for options
"  question_header = ' :benj: ', -- Header to use for user questions
"  answer_header = ' skynet ', -- Header to use for AI answers
"  error_header = ' whoops! ', -- Header to use for errors
"  separator = '───', -- Separator to use in chat -- https://github.com/copilotc-nvim/copilotchat.nvim?tab=readme-ov-file#configuration
"
"  window = {
"    layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace', or a function that returns the layout
"    width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
"    height = vim.o.lines - 6, -- fractional height of parent, or absolute height in rows when > 1
"    -- Options below only apply to floating windows
"    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
"    border = 'rounded', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
"    row = 1, -- row position of the window, default is centered
"    col = math.floor(vim.o.columns / 2), -- column position of the window, default is centered
"    title = ' 󱜸 Lets talk... ', -- title of chat window
"    --footer = nil, -- footer of chat window
"    --zindex = 1, -- determines if window is on top or below other floating windows
"  },
"}
"EOF

" }}}

" [ WildMenu - wilder.nvim ] {{{

" wilder breaks copiolet (doesn't show at all) and coc auto complete (can't arrow down to select and on enter breaks)
"so ~/dotfiles/vimide/.vim/rc-conf/plugs/wilder.vim

" }}}

" [ ClaudeCode ] {{{

lua << EOF
require('claude-code').setup({
  -- Terminal window settings
  window = {
    split_ratio = 0.4,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
    position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "float", etc.
    enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
    hide_numbers = true,    -- Hide line numbers in the terminal window
    hide_signcolumn = true, -- Hide the sign column in the terminal window
    
    -- Floating window configuration (only applies when position = "float")
    float = {
      width = "80%",        -- Width: number of columns or percentage string
      height = "80%",       -- Height: number of rows or percentage string
      row = "center",       -- Row position: number, "center", or percentage string
      col = "center",       -- Column position: number, "center", or percentage string
      relative = "editor",  -- Relative to: "editor" or "cursor"
      border = "rounded",   -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
    },
  },
  -- File refresh settings
  refresh = {
    enable = true,           -- Enable file change detection
    updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
    timer_interval = 500,    -- How often to check for file changes (milliseconds)
    show_notifications = true, -- Show notification when files are reloaded
  },
  -- Git project settings
  git = {
    use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
  },
  -- Shell-specific settings
  shell = {
    separator = '&&',        -- Command separator used in shell commands
    pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
    popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
  },
  -- Command settings
  command = "claude",        -- Command used to launch Claude Code
  -- Command variants
  command_variants = {
    -- Conversation management
    continue = "--continue", -- Resume the most recent conversation
    resume = "--resume",     -- Display an interactive conversation picker

    -- Output options
    verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
  },
  -- Keymaps
  keymaps = {
    toggle = {
      normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
      terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
      variants = {
        continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
        verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
      },
    },
    window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
    scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
  }
})
EOF

" }}}

" see .vim/plugin/my-conf.vim for configuration
