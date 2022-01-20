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


function! DayOfTheWeek()
  return strftime("%a")
endfunction
call airline#parts#define_function('today', 'DayOfTheWeek')

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  if (a == 0 && m == 0 && r == 0)
    return ''
  endif
  let s = []
  if a > 0
    let astr = printf('+%d', a)
    call add(s, astr)
  endif
  if m > 0
    let mstr = printf('~%d', m)
    call add(s, mstr)
  endif
  if r > 0
    let rstr = printf('-%d', r)
    call add(s, rstr)
  endif
  return join(s, ' ')
endfunction
call airline#parts#define_function('gitstats', 'GitStatus')

function! AirlineInit()
  let g:airline_section_a = airline#section#create_left(['mode','%n'])
  let g:airline_section_b = airline#section#create_left(['today','gitstats'])
  let g:airline_section_y = airline#section#create(['%P'])
  let g:airline_section_z = '%2l/%L☰ %2v'
endfunction
autocmd VimEnter * call AirlineInit()

" disable auto truncation of section A,B,C and Z
"let g:airline#extensions#section_trucate_width = {
"  \ 'a': 20,
"  \ 'z': 80,
"  \ 'warning': 80,
"  \ 'error': 80
"  \ }
" get rid of elipses
let g:airline_mode_map = {'c': 'C', 'n': 'N', 'V': 'V', 'i': 'I'}

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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extesions#tabline#formatter = 'unique_tail'

" Show buffers
"let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1

" truncate long branch names to a fixed length >
"let g:airline#extensions#branch#displayed_head_limit = 10

" change the text for when no branch is detected
let g:airline#extensions#branch#empty_message = ''

" enable/disable showing a summary of changed hunks under source control.
"let g:airline#extensions#hunks#enabled = 1

" enable/disable showing only non-zero hunks.
"let g:airline#extensions#hunks#non_zero_only = 1

" enable coc integration
let g:airline#extensions#coc#enabled = 1
" Change error symbol:
"let airline#extensions#coc#error_symbol = 'Error:'
"Change warning symbol:
"let airline#extensions#coc#warning_symbol = 'Warning:'
"Change error format:
"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"Change warning format:
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Pick one:
 let g:airline#extensions#ctrlp#color_template = 'insert' " (default)
" let g:airline#extensions#ctrlp#color_template = 'normal'
" let g:airline#extensions#ctrlp#color_template = 'visual'
" let g:airline#extensions#ctrlp#color_template = 'replace'
