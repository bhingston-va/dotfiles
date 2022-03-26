" [ Vim-Plug ] {{{
call plug#begin('~/dotfiles/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gerw/vim-HiLinkTrace'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" }}}

" [ Toggle visibility of naughty characters ] {{{
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
set lcs=tab:»»,trail:·,nbsp:~

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
"   autocmd BufEnter  *.txt   set nolist
"   autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END
hi SpecialKey cterm=NONE ctermfg=darkgray gui=NONE guifg=#696969

"refreshes to new vimrc
"autocmd BufWritePost .vimrc source %

" This avoids wonky colours on sourcing vimrc.
"augroup source_vimrc
"    autocmd!
"    autocmd BufWritePost .vimrc,_vimrc,vimrc
"        \ source $MYVIMRC | AirlineRefresh
"augroup END
" }}}


" [ Set up smarter search behaviour ] {{{
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       " ...unless uppercase letters used
set hlsearch        "Highlight all matches
set magic

"Delete in normal mode to switch off highlighting till next search and clear messages...
nmap <silent> <BS> [Cancel highlighting]  :nohlsearch <BAR> call Toggle_CursorColumn('off')<CR>
syntax on

"Double-delete to remove search highlighting *and* trailing whitespace...
nmap <silent> <BS><BS>  [Cancel highlighting and remove trailing whitespace]
\             mz:%s/\s\+$//g<CR>`z:nohlsearch<CR>
hi Search cterm=NONE ctermbg=0 ctermfg=165
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable highlight with <tab>
nnoremap <silent> <tab> :nohl<cr>

" Center found words on screen
nnoremap N Nzz
nnoremap n nzz

" Show syntax highlighting groups for word under cursor
nnoremap <CS-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo remap(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

noremap <C-p> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

for id in synstack(line("."), col("."))
   echo synIDattr(id, "name")
endfor
" }}}


" [ There can be only one (one Vim session per file) ] {{{
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists *  let v:swapchoice = 'o'
    autocmd SwapExists *  echohl ErrorMsg
    autocmd SwapExists *  echo 'Duplicate edit session (readonly)'
    autocmd SwapExists *  echohl None
    autocmd SwapExists *  call Make_session_finder( expand('<afile>') )
    autocmd SwapExists *  sleep 2
augroup END

function! Make_session_finder (filename)
    exec 'nnoremap ss :!terminal_promote_vim_session ' . a:filename . '<CR>:q!<CR>'
endfunction
" }}}

" [ Make Visual modes work better ] {{{
" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

vnoremap v <C-V>
vnoremap <C-V> v
vnoremap i I
vnoremap a A

" Quick exit
vnoremap <cr> <esc>
xnoremap <cr> <esc>

"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vnoremap <BS> x

"When shifting, retain selection over multiple shifts...
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
    set nosmartindent
    if mode() ==# "V"
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction

" Temporarily add a column indicator when inserting or appending in visual mode...
" (Should use <C-O> instead, but it doesn't seem to work)
"vnoremap <silent>  I  I<C-R>=TemporaryColumnMarkerOn()<CR>
"vnoremap <silent>  A  A<C-R>=TemporaryColumnMarkerOn()<CR>
"
"function! TemporaryColumnMarkerOn ()
"    let g:prev_cursorcolumn_state = g:cursorcolumn_visible ? 'on' : 'off'
"  call Toggle_CursorColumn('on')
"   inoremap <silent>  <ESC>  <ESC>:call TemporaryColumnMarkerOff(g:prev_cursorcolumn_state)<CR>
"   return ""
"endfunction
"
"function! TemporaryColumnMarkerOff (newstate)
"   call Toggle_CursorColumn(a:newstate)
"  iunmap <ESC>
"endfunction
" }}}


" [ Toggle syntax highlighting ] {{{
"syntax enable
"Nmap <silent> y [Toggle syntax highlighting]
"                 \ : if exists("syntax_on") <BAR>
"                 \    syntax off <BAR>
"                 \ else <BAR>
"                 \    syntax enable <BAR>
"                 \ endif<CR>
" }}}


" [ Miscellaneous features (mainly options) ] {{{

set title         "Show filename in titlebar of window
set titleold=
"set textwidth=100 "Wrap at column #
set scrolloff=5   "Scroll when 5 lines from top/bottom

" Toggles between relative number and numbered line
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
"nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set relativenumber
"set nocursorcolumn

" sets the split bewteen windows to be grey
hi VertSplit       ctermfg=244 ctermbg=232   cterm=none
" }}}


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
"let mapleader= "\<c-m>"
nnoremap <Space> <nop>
let mapleader= " "
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

"function! ToggleEnterMapping()
"  if empty(mapcheck('<CR>', 'i'))
"   inoremap <CR> <Esc>
"   return "\<Esc>"
" else
"   iunmap <CR>
"   return "\<CR>"
" endif
"endfunction
"call ToggleEnterMapping()
"inoremap <expr> <S-CR> ToggleEnterMapping()
"" Optional (so <CR> cancels prefix, selection, operator).
"nnoremap <CR> <Esc>
"vnoremap <CR> <Esc>gV
"onoremap <CR> <Esc>
" }}}

" [ Set up Indentation with Spaces & Tabs ] {{{
set ruler
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
"set shiftround    "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
set autoindent     "Auto indents next line to the prevous line
"set expandtab

augroup TabWidth
    autocmd!
    autocmd BufEnter *.scss set tabstop=2
    autocmd BufEnter *.scss set shiftwidth=2
    autocmd BufEnter *.css set tabstop=2
    autocmd BufEnter *.css set shiftwidth=2
    autocmd BufEnter *.html set tabstop=2
    autocmd BufEnter *.html set shiftwidth=2
    autocmd BufEnter *.tex set tabstop=2
    autocmd BufEnter *.tex set shiftwidth=2
augroup END

augroup TabExpandage
    autocmd!
    autocmd BufEnter  *.cpp   ret
"   autocmd BufEnter  *.txt   ret
    autocmd BufEnter  *.c     ret
    autocmd BufEnter  *.java  ret
    autocmd BufEnter  *.hs    ret
    autocmd BufEnter  *.hs    set expandtab
    autocmd BufEnter  *.cpp   set expandtab
    autocmd BufEnter  *.c     set expandtab
    autocmd BufEnter  *.java  set expandtab
    autocmd BufEnter  *.sh    set expandtab
    autocmd BufEnter  *.html  set expandtab
    autocmd BufEnter  *.tex   set expandtab
augroup END

"The following three lines map Ctrl+s to save in vi.  You can comment
"these out, it has nothing to do with syntax highlighting or colors
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
inoremap <c-s> <Esc><c-s>

"set background=dark
"set hlsearch
"set nu
"set smartindent
"filetype on
"filetype plugin indent on

"colorscheme earthAndFire
"au BufReadPost *.twig colorscheme koehler
au BufReadPost *.css colorscheme slate
au BufReadPost *.js colorscheme elflord
au BufReadPost *.py colorscheme earthAndFire
au BufReadPost *.html colorscheme monokai
"au BufReadPost *.java colorscheme monokai
"au BufReadPost *.java colorscheme koehler " really like this one
"au BufReadPost *.java colorscheme peachpuff
"au BufReadPost *.java colorscheme slate   " this is okay
"au BufReadPost *.java colorscheme zellner
"au BufReadPost *.php colorscheme monokai
au BufReadPost *.java colorscheme earthAndFire " this is mine
au BufReadPost *.cc   colorscheme earthAndFire " this is mine
au BufReadPost *.cpp  colorscheme earthAndFire " this is mine
" }}}


" [ Highlight cursor (plus row and column on request) ] {{{

" Inverse highlighting for cursor...
"highlight CursorInverse   term=inverse ctermfg=black ctermbg=cyan
"call matchadd('CursorInverse', '\%#', 100)
"
"" Need an invisible cursor column to make it update on every cursor move...
"highlight clear CursorColumn
"highlight CursorColumn term=none cterm=none
"set cursorcolumn

" Toggle cursor row highlighting on request...

nmap <silent> :r [Toggle cursor line highlighting] :set cursorline!<CR>

" Toggle cursor column highlighting on request...
nmap <silent> :c [Toggle cursor row highlighting] :silent call Toggle_CursorColumn('flip')<CR>

" Implement cursor toggle...
let g:cursorcolumn_visible = 0
function! Toggle_CursorColumn (requested_state)
    if a:requested_state == 'off' || g:cursorcolumn_visible && a:requested_state == 'flip'
        let g:cursorcolumn_visible = 0
        highlight clear CursorColumn
        highlight CursorColumn term=none cterm=none
    else
        let g:cursorcolumn_visible = 1
        highlight CursorColumn term=bold ctermfg=black ctermbg=cyan cterm=bold
    endif
endfunction

" Show matching brackets when text indicator is over them
" set showmatch
" }}}


" [ Correct common mistypings on-the-fly ] {{{

iab    retrun  return
iab    reture  return
iab    rertun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab  liekwise  likewise
iab      Pelr  Perl
iab      pelr  perl
iab        ;t  't
iab    Jarrko  Jarkko
iab    jarrko  jarkko
iab      moer  more
iab  previosu  previous
iab      ture  true
"sudo code
iab       rti  refToInteger
iab       aoi  ArrayOfIntegers
iab       rtc  refToChar
iab       aoc  ArrayOfChars
iab       rtf  refToFloat
iab       aof  ArrayOfFloats
"for loops
iab     foriL  for(int i = 0; i < n; i++) {
iab     forjL  for(int j = 0; j < n; j++) {
iab     forkL  for(int k = 0; k < n; k++) {
" c++ lines
iab      cout  cout <<
iab      cin.  cin.getline(
iab      cinn  cin >>
"brakets
"iab         (  ()<Esc>i
"iab         { {<Esc>o}jkO
" Pressing <leader>ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>
" Toggle paste mode on and off
imap <leader>pp <Esc>:setlocal paste!<cr>i
noremap <leader>pp :setlocal paste!<cr>
" }}}


" [ Config Syntax Highlighting ] {{{
set bg=dark
hi Comment    cterm=none ctermfg=238
hi Type       cterm=bold ctermfg=123 " Type
hi PreProc    cterm=none ctermfg=088 " bold
hi Special    cterm=none ctermfg=124 " <ESC>
hi Statement  cterm=none ctermfg=228 " hi 172,166,214,195,230,145,124
hi Identifier cterm=bold ctermfg=075 " a:newstate
hi Constant   cterm=none ctermfg=039 " 039
hi Underlined cterm=none ctermfg=100
hi LineNr ctermfg=006 ctermbg=0 cterm=none

augroup Over80Red
    autocmd!
    autocmd BufEnter  *.cc    highlight OverLength ctermfg=red guibg=#592929
    autocmd BufEnter  *.cc    match OverLength /\%81v.*/
    autocmd BufEnter  *.cpp   highlight OverLength ctermfg=red guibg=#592929
    autocmd BufEnter  *.cpp   match OverLength /\%81v.*/
"   autocmd BufEnter  *.java  highlight OverLength ctermfg=red guibg=#592929
"   autocmd BufEnter  *.java  match OverLength /\%81v.*/
augroup END


augroup TextTitles
    autocmd!
    autocmd BufEnter *.txt highlight TextTitles cterm=none ctermfg=124
    autocmd BufEnter *.txt match TextTitles /"\."/
    autocmd BufReadPost *.txt highlight TextTitles cterm=none ctermfg=124
    autocmd BufReadPost *.txt match TextTitles /"\."/
augroup END

augroup TextNumbers
    autocmd!
    autocmd BufEnter *.txt highlight TextNumbers cterm=none ctermfg=228
    autocmd BufEnter *.txt match TextNumbers /\d\+/
    autocmd BufReadPost *.txt highlight TextNumbers cterm=none ctermfg=228
    autocmd BufReadPost *.txt match TextNumbers /\d\+/
augroup END


augroup TextTerm
    autocmd!
    autocmd BufEnter *.txt highlight TextTerm cterm=none ctermfg=039
    autocmd BufEnter *.txt match TextTerm /\<\u\{2,}\>/
    autocmd BufReadPost *.txt highlight TextTerm cterm=none ctermfg=039
    autocmd BufReadPost *.txt match TextTerm /\<\u\{2,}\>/
augroup END

"for cSyntaxAfter
"autocmd! FileType c,cc,cpp,java call CSyntaxAfter()

" for operator_highlight.vim by Valloric
let g:ophigh_color = 226
" }}}


" [ Config CursorLine & Background ] {{{
augroup Over80Grey
    autocmd!
    autocmd BufEnter  *.cc   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.cc   :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.cpp  execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.cpp  :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.c    execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.c    :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.java execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.java :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.hs   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.hs   :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.py   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.py   :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.go   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.go   :highlight ColorColumn ctermbg=233 guibg=lightgrey
augroup END

"execute "set colorcolumn=" . join(range(81,335), ',')
":highlight ColorColumn ctermbg=233 guibg=lightgrey

set cursorline
hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred guifg=white
hi CursorColumn   cterm=NONE ctermbg=232 guibg=darkred guifg=white
nnoremap <Leader>c :set cursorcolumn!<CR>
"set colorcolumn=81
" }}}


" [ Highlight cursor (plus row and column on request) ] {{{
" Inverse highlighting for cursor...
highlight CursorInverse   term=inverse ctermfg=black ctermbg=cyan
call matchadd('CursorInverse', '\%#', 100)

" Need an invisible cursor column to make it update on every cursor move...
highlight clear CursorColumn
highlight CursorColumn term=none cterm=none ctermbg=232
set cursorcolumn
" Show matching brackets when text indicator is over them
" set showmatch
" }}}


" [ Status Line - Vim-Airline] {{{
"set guifont=Andale\ Mono\ for\ Powerline
"" Always show status bar.
"let g:powerline_loaded = 1
"set laststatus=2
"let g:Powerline_symbols = 'fancy'

" this turns off powerline when saved
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

  " unicode symbols
"  let g:airline_left_sep = '▶'
"" let g:airline_left_sep = '◑'
"  let g:airline_right_sep = '◀'
"" let g:airline_right_sep = '◐'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.whitespace = 'Ξ'
"" let g:airline_symbols.whitespace = '¤'

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode',' ','branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc','%f'])
    let g:airline_section_x = airline#section#create(['filetype'])
    let g:airline_section_y = airline#section#create(['%P', ' ', '%l'])
endfunction
autocmd VimEnter * call AirlineInit()

"Adds completion help on commands
set wildmenu

" Customize statusline
"set statusline=%f         " Path to the file
"set statusline+=\ -\      " Separator
"set statusline+=FileType: " Label
"set statusline+=%y        " Filetype of the file
"set statusline+=%=        " Switch to the right side
"set statusline+=%l        " Current line
"set statusline+=/         " Separator
"set statusline+=%L        " Total lines

"" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Show buffers
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 0

" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1

" truncate long branch names to a fixed length >
let g:airline#extensions#branch#displayed_head_limit = 10

" change the text for when no branch is detected
let g:airline#extensions#branch#empty_message = ''

" enable/disable showing a summary of changed hunks under source control.
"let g:airline#extensions#hunks#enabled = 1

" enable/disable showing only non-zero hunks.
"let g:airline#extensions#hunks#non_zero_only = 1

" Pick one:
 let g:airline#extensions#ctrlp#color_template = 'insert' " (default)
" let g:airline#extensions#ctrlp#color_template = 'normal'
" let g:airline#extensions#ctrlp#color_template = 'visual'
" let g:airline#extensions#ctrlp#color_template = 'replace'
" }}}


" [ File Editing ] {{{
" Return to last edit position when opening files.
" autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Move block
vnoremap J xp`[V`]
vnoremap K xkP`[V`]

" Delete trailing white space on save, useful for Python and others
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
"  exe "normal `z"
endfunc

:augroup deleteWhitespace
:   autocmd!
:
:   autocmd BufWrite *.sh :call DeleteTrailingWS()
:   autocmd BufWrite *.hs :call DeleteTrailingWS()
:   autocmd BufWrite *.cc :call DeleteTrailingWS()
:   autocmd BufWrite *.c :call DeleteTrailingWS()
:   autocmd BufWrite *.cpp :call DeleteTrailingWS()
:   autocmd BufWrite *.java :call DeleteTrailingWS()
:   autocmd BufWrite *.vim :call DeleteTrailingWS()
:   autocmd BufWrite *.txt :call DeleteTrailingWS()
:   autocmd BufWrite *.md :call DeleteTrailingWS()
:   autocmd BufWrite *.py :call DeleteTrailingWS()
:   autocmd BufWrite *.tex :call DeleteTrailingWS()
:   autocmd BufWrite *.go :call DeleteTrailingWS()
:augroup END
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" }}}


" [ University Stuff ] {{{
" Assignment header
nnoremap <leader>aa ggOBenj Hingston<cr>11152686<cr>bvh895<cr>
" }}}


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
:set nornu " for pycharm only so realtive is off
