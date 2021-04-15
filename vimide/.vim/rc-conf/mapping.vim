" [ Remap various keys to something more useful ] {{{
"moving around in vim
nnoremap ; :
nnoremap : ;
inoremap jk <Esc>
inoremap kj <Esc>
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

"to move between buffers
nnoremap <C-H> :bprevious<CR>
nnoremap <C-L> :bnext<CR>

" print path to current buffer (this doesn't quite work)
nnoremap <leader><space>p :!ls %:p<CR>

"" yank/put uses clipboards
"" PRIMARY - This is copy-on-select, and can be pasted with the middle mouse button.
"" CLIPBOARD - This is copied with (usually) ^C, and pasted with ^V (It's like MS Windows).
"noremap <Leader>y "*y
"noremap <Leader>p "*p
"" note OS-X uses single clipboard so + and * are the same so don't need the following
""noremap <Leader>Y "+y
""noremap <Leader>P "+p
"" Nvim has built in support
set clipboard+=unnamedplus

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

" [ Open keys ]
" U
" \
" |
" +
" ^
" %
" & ?? no idea
" M goes to the middle

" }}}
