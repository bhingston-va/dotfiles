" [ Config Syntax Highlighting ] {{{
" go sytax colours
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" }}}

" auto lint on save but timeout after 5 seconds
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" info on hover
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1

" highlight cursor match
let g:go_auto_sameids = 1

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
