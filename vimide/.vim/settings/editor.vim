" [ Miscellaneous features (mainly options) ] {{{
set title         "Show filename in titlebar of window
set titleold=
set scrolloff=5   "Scroll when 5 lines from top/bottom

nnoremap <Space> <nop>
let mapleader= " "

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

" sets the split bewteen windows to be grey
hi VertSplit       ctermfg=244 ctermbg=232   cterm=none

" Pressing <leader>ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>
" Toggle paste mode on and off
imap <leader>pp <Esc>:setlocal paste!<cr>i
noremap <leader>pp :setlocal paste!<cr>
" }}}

" [ Set up Indentation with Spaces & Tabs ] {{{
set ruler
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
set autoindent     "Auto indents next line to the prevous line

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
" }}}


" [ colorschemes ] {{{
"colorscheme FireCode
"au BufReadPost *.twig colorscheme koehler
"au BufReadPost *.css colorscheme slate
"au BufReadPost *.js colorscheme elflord
"au BufReadPost *.ts colorscheme elflord
"au BufReadPost *.py colorscheme earthAndFire
"au BufReadPost *.html colorscheme monokai
"au BufReadPost *.java colorscheme monokai
"au BufReadPost *.java colorscheme koehler " really like this one
"au BufReadPost *.java colorscheme peachpuff
"au BufReadPost *.java colorscheme slate   " this is okay
"au BufReadPost *.java colorscheme zellner
"au BufReadPost *.php colorscheme monokai
"au BufReadPost *.java colorscheme earthAndFire " this is mine
"au BufReadPost *.cc   colorscheme earthAndFire " this is mine
"au BufReadPost *.cpp  colorscheme earthAndFire " this is mine
"au BufReadPost *.go  colorscheme earthAndFire " this is mine
" }}}

" [ Highlight cursor (plus row and column on request) ] {{{
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

" Inverse highlighting for cursor...
highlight CursorInverse   term=inverse ctermfg=black ctermbg=cyan
call matchadd('CursorInverse', '\%#', 100)

" Need an invisible cursor column to make it update on every cursor move...
highlight clear CursorColumn
highlight CursorColumn term=none cterm=none ctermbg=232
set cursorcolumn
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

" for operator_highlight.vim by Valloric
let g:ophigh_color = 226

" go sytax colours (vim-go)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
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
    autocmd BufEnter  *.ts   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.ts   :highlight ColorColumn ctermbg=233 guibg=lightgrey
augroup END

set cursorline
hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred guifg=white
hi CursorColumn   cterm=NONE ctermbg=232 guibg=darkred guifg=white
nnoremap <Leader>c :set cursorcolumn!<CR>
" }}}
