" [ Config Syntax Highlighting ] {{{
augroup TextTitles
  autocmd!
  autocmd BufEnter    *.txt highlight TextTitles cterm=none ctermfg=124
  autocmd BufEnter    *.txt match TextTitles /"\."/
  autocmd BufReadPost *.txt highlight TextTitles cterm=none ctermfg=124
  autocmd BufReadPost *.txt match TextTitles /"\."/
augroup END

augroup TextNumbers
  autocmd!
  autocmd BufEnter    *.txt highlight TextNumbers cterm=none ctermfg=228
  autocmd BufEnter    *.txt match TextNumbers /\d\+/
  autocmd BufReadPost *.txt highlight TextNumbers cterm=none ctermfg=228
  autocmd BufReadPost *.txt match TextNumbers /\d\+/
augroup END


augroup TextTerm
  autocmd!
  autocmd BufEnter    *.txt highlight TextTerm cterm=none ctermfg=039
  autocmd BufEnter    *.txt match TextTerm /\<\u\{2,}\>/
  autocmd BufReadPost *.txt highlight TextTerm cterm=none ctermfg=039
  autocmd BufReadPost *.txt match TextTerm /\<\u\{2,}\>/
augroup END
" }}}
