" vim-gitgutter & vim-fugitive
hi! link SignColumn LineNr

hi GitGutterAdd    guifg=#009900 ctermfg=2
hi GitGutterChange guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guifg=#ff2222 ctermfg=1

hi DiffText cterm=bold ctermfg=003 ctermbg=002 gui=bold guibg=#77dffb guifg=DarkBlue
hi DiffAdd ctermbg=4 guibg=DarkBlue
hi DiffChange ctermbg=3 ctermfg=000 guifg=#000000 guibg=#117496
hi DiffDelete ctermfg=0 ctermbg=052 guifg=#000000 guibg=#5f0000

hi! link Folded VertSplit
hi! link FoldColumn Folded
