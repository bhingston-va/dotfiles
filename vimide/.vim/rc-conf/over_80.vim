augroup Over80Red
    autocmd!
    autocmd BufEnter  *.cc    highlight OverLength ctermfg=red guibg=#592929
    autocmd BufEnter  *.cc    match OverLength /\%81v.*/
    autocmd BufEnter  *.cpp   highlight OverLength ctermfg=red guibg=#592929
    autocmd BufEnter  *.cpp   match OverLength /\%81v.*/
"   autocmd BufEnter  *.java  highlight OverLength ctermfg=red guibg=#592929
"   autocmd BufEnter  *.java  match OverLength /\%81v.*/
augroup END

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
