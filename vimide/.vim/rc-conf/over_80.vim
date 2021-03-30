augroup Over80Red
  autocmd!
  autocmd BufEnter *.cc  hi OverLength ctermfg=red
  autocmd BufEnter *.cc  match OverLength /\%81v.*/
  autocmd BufEnter *.cpp hi OverLength ctermfg=red
  autocmd BufEnter *.cpp match OverLength /\%81v.*/
augroup END

augroup Over80Grey
  autocmd!
  autocmd BufEnter *.hs   execute "set colorcolumn=" . join(range(81,335), ',')
  autocmd BufEnter *.hs   :hi ColorColumn ctermbg=233 guibg=lightgrey
  autocmd BufEnter *.py   execute "set colorcolumn=" . join(range(81,335), ',')
  autocmd BufEnter *.py   :hi ColorColumn ctermbg=233 guibg=lightgrey
  autocmd BufEnter *.go   execute "set colorcolumn=" . join(range(81,335), ',')
  autocmd BufEnter *.go   :hi ColorColumn ctermbg=233 guibg=lightgrey
  autocmd BufEnter *.ts   execute "set colorcolumn=" . join(range(81,335), ',')
  autocmd BufEnter *.ts   :hi ColorColumn ctermbg=233 guibg=lightgrey
augroup END