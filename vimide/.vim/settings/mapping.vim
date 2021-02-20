" [ Remap various keys to something more useful ] {{{
"moving around in vim
nnoremap X <PageDown>
nnoremap ; :
nnoremap : ;
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <Esc>`^
nnoremap # <PageUp>
inoremap <cr> <cr>
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

"more natural spliting
set splitbelow
set splitright

"move around split screens windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
"to move split screen around
nnoremap m <c-w>

"   CONTROLS TO KNOW
":bd to quit a buffer"
":vert sb 'N' to slit a buffer"
":vsp | b'N' to slit a buffer"
":b MyFile
"to move between buffers::
nnoremap <C-H> :bprevious<CR>
nnoremap <C-L> :bnext<CR>

"enable mouse and arrow keys in insert mode
set mouse=a
imap <ESC>OA <ESC>ki
imap <ESC>OB <ESC>ji
imap <ESC>OC <ESC>li
imap <ESC>OD <ESC>hi

" Remap VIM 0 to first non-blank character
nnoremap 0 ^
" Remap - to end of line
noremap - $
" }}}
