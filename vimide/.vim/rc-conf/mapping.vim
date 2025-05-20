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

" mark it (doesn't work because it is a prefix key)
" see https://chatgpt.com/share/682cec4b-58b8-8000-a07c-a49a2c61186c for more details
"nnoremap <C-m> m

" see commit message, was seeing issues around when going to references in quick lists.
" Looked like enter was mapped to something else.
nnoremap <CR> <CR>

"move around split screens windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
"to move split screen around
"see "mark it" above where we can't remap mark so going to leave m
"also no good letter left for moving between windows
"nnoremap m <c-w>

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

" Remap - to first non-blank character
nnoremap <C-A> ^
" Remap - to end of line
noremap <C-E> $

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
