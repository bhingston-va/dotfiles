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

" Make naughty characters visible
" Set up smarter search behaviour
so ~/dotfiles/vimide/.vim/settings/search.vim

" There can be only one (one Vim session per file)
so ~/dotfiles/vimide/.vim/settings/prevent_dup_edits.vim

" Make Visual modes work better
so ~/dotfiles/vimide/.vim/settings/visual_mode.vim

" Remap various keys to something more useful
so ~/dotfiles/vimide/.vim/settings/mapping.vim

" Miscellaneous features (mainly options)
" Set up Indentation with Spaces & Tabs
" Colourschemes
" Highlight cursor (plus row and column on request)
" Config Syntax Highlighting
" Config CursorLine & Background
so ~/dotfiles/vimide/.vim/settings/editor.vim

" Return to last edit position when opening files.
" Move block of code
" Delete trailing white space on save, useful for Python and others
" Don't close window, when deleting a buffer
so ~/dotfiles/vimide/.vim/settings/buffer.vim

" [ Open keys ]: {{{
" U
" \
" |
" +
" ^
" %
" & ?? no idea
" M goes to the middle
" }}}
:set encoding=utf-8

" IDE Features
" NAVIGATION
" - go to file (fuzzy search)
" - find and go to definition and usages
" - forward/backward cursor navigation (x-files)
" - target file in directory (import navigation)
" EDITING
" - Refactor/rename (x-files)
" - Multi file edit
" - Auto complete suggestions
" LOCATION
" - file text search (word, caps sensitive options)
" - project text search (word, caps sensitive options)
so ~/dotfiles/vimide/.vim/settings/ide.vim
