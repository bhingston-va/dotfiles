" IDE Features below
" NEEDS
" - definition and usage location (maybe ctags?) [Coc + LSP]
" - file and project text search (function, class, text, filename) [Rg + fzf]
" - tree directory [NERDTree]
" - debugger (breakpoints, play, stepper, evaluate) [vim-go for go, ? for typescript]
" - run/debug tests [vim-go for go, ? for typescript]
" - multi file edit [native buffers + Vim-Airline]
" - autocomplete [CoC + LSP]
" - uncommitted line edits (deletions, insertions, updated) [GitGutter]
" - git blame with indication of newest changes and time [Fugitive]
" WANTS
" - spell check with suggestions (spell check with vimrc opts, suggestions with ?)


" [ File tree - NERDTree ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/nerdtree.vim
" }}}

" [ Git - Gutter ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-gitgutter.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-fugitive.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/git-messenger.vim

" [ Status Line - Vim-Airline] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-airline.vim
" }}}


" [ FzF & vim-ripgrep ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/fzf.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-ripgrep.vim
" }}}

" [ in file navigation: Sneak ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-sneak/vim-sneak.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/minimap.vim
" }}}

" [ buffer navigation: vim-maximizer] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-maximizer.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/harpoon.vim
" }}}

" [ vim-go ] {{{
"so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-go.vim <- sourced from my-conf.vim
" }}}

" [ Conquer of Completion & extensions ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/coc/coc.vim
so ~/dotfiles/vimide/.vim/rc-conf/plugs/coc/coc-jest.vim
" }}}

" [ vimspector ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vimspector.vim
" }}}

" [ Splash Screen ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-startify.vim
" }}}

" [ http client ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/vim-rest-console.vim
" }}}

" [ codeium ] {{{
so ~/dotfiles/vimide/.vim/rc-conf/plugs/codeium.vim
" }}}
