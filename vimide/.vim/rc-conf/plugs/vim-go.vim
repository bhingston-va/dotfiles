" [ Config Syntax Highlighting ] {{{
" go sytax colours
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_function_parameters = 0
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" }}}

" auto lint on save but timeout after 5 seconds
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" set up debugging windows preferences
let g:go_debug_windows = {
  \ 'vars':  'botright 30new',
  \ 'stack': 'botright 10new',
  \ 'out':   'botright 5new',
\ }


" debugging commands (while debugging)
let g:go_debug_mappings = {
  \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
  \ '(go-debug-stop)': {'key': 'q'},
  \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
  \ '(go-debug-step)': {'key': 's'},
\}


" info on hover
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1

" highlight cursor match
let g:go_auto_sameids = 1

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
