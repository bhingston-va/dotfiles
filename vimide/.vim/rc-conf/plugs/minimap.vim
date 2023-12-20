nnoremap <silent> `` :nohl<CR>:call minimap#vim#ClearColorSearch()<CR>

let g:minimap_base_highlight = 'Comment'

let g:minimap_highlight_search = 1
hi MinimapSearch ctermfg=228 guifg=#ffff87
let g:minimap_search_color = 'MinimapSearch'

let g:minimap_git_colors = 1
hi MinimapGitAdd ctermbg=0 ctermfg=022 guibg=#000000 guifg=#005f00
hi MinimapGitDel ctermbg=0 ctermfg=052 guibg=#000000 guifg=#5f0000
hi MinimapGitEdt ctermbg=0 ctermfg=100 guibg=#000000 guifg=#6f6f00
hi MinimapGitAddRg ctermbg=0 ctermfg=02 guibg=#000000 guifg=#009900
hi MinimapGitDelRg ctermbg=0 ctermfg=88 guibg=#000000 guifg=#870000
hi MinimapGitEdtRg ctermbg=0 ctermfg=03 guibg=#000000 guifg=#bbbb00
hi MinimapGitAddLn cterm=bold ctermbg=0 ctermfg=02 gui=bold guibg=#000000 guifg=#009900
hi MinimapGitDelLn cterm=bold ctermbg=0 ctermfg=88 gui=bold guibg=#000000 guifg=#870000
hi MinimapGitEdtLn cterm=bold ctermbg=0 ctermfg=03 gui=bold guibg=#000000 guifg=#bbbb00
let g:minimap_diffadd_color = 'MinimapGitAdd'
let g:minimap_diffremove_color = 'MinimapGitDel'
let g:minimap_diff_color = 'MinimapGitEdt'
let g:minimap_cursor_diffadd_color = 'MinimapGitAddLn'
let g:minimap_cursor_diffremove_color = 'MinimapGitDelLn'
let g:minimap_cursor_diff_color = 'MinimapGitEdtLn'
let g:minimap_range_diffadd_color = 'MinimapGitAddRg'
let g:minimap_range_diffremove_color = 'MinimapGitDelRg'
let g:minimap_range_diff_color = 'MinimapGitEdtRg'

hi MinimapCurrentLine ctermfg=159 ctermbg=0 guifg=#afffff guibg=#000000
let g:minimap_cursor_color = 'MinimapCurrentLine'
let g:minimap_highlight_range = 1
hi MinimapCurrentView ctermfg=6 ctermbg=0 guifg=#008080 guibg=#000000
let g:minimap_range_color = 'MinimapCurrentView'
