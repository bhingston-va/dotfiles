" Set up smarter search behaviour
so ~/dotfiles/vimide/.vim/rc-conf/search.vim

" There can be only one (one Vim session per file)
so ~/dotfiles/vimide/.vim/rc-conf/prevent_dup_edits.vim

" Make Visual modes work better
so ~/dotfiles/vimide/.vim/rc-conf/visual_mode.vim

" Remap various keys to something more useful
so ~/dotfiles/vimide/.vim/rc-conf/mapping.vim

" Make naughty characters visible
" Miscellaneous features (mainly options)
" Set up Indentation with Spaces & Tabs
"so ~/dotfiles/vimide/.vim/rc-conf/editor.vim <- sourced from color

" Config CursorLine & Background
" Highlight cursor (plus row and column on request)
"so ~/dotfiles/vimide/.vim/rc-conf/color_cursor.vim <- sourced from color
" Config Syntax Highlighting
so ~/dotfiles/vimide/.vim/rc-conf/color_go.vim
"so ~/dotfiles/vimide/.vim/rc-conf/color_txt.vim <- sourced from color
"so ~/dotfiles/vimide/.vim/rc-conf/over_80.vim <- sourced from color
" Colourschemes
so ~/dotfiles/vimide/.vim/rc-conf/colorscheme.vim

" Return to last edit position when opening files.
" Move block of code
" Delete trailing white space on save, useful for Python and others
" Don't close window, when deleting a buffer
so ~/dotfiles/vimide/.vim/rc-conf/buffer.vim

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
so ~/dotfiles/vimide/.vim/rc-conf/ide.vim
