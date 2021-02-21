" IDE Features below
" NEEDS
" - definition and usage location (maybe ctags?)
" - file and project text search (function, class, text, filename)
" - sub project text search (example gmail extension, frontend/angular/projects)
" - tree directory [NERDTree]
" - debugger (breakpoints, play, stepper, evaluate)
" - run/debug tests
" - multi file edit [native buffers + Vim-Airline]
" - autocomplete
" - uncommitted line edits (deletions, insertions, updated)
" - git blame with indication of newest changes and time
" WANTS
" - spell check with suggestions (spell check with vimrc opts, suggestions with ?)


" [ File tree - NERDTree ] {{{
" easy open nerd tree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = 'ᗒ'
"let g:NERDTreeDirArrowCollapsible = 'ᗐ'
"let g:NERDTreeDirArrowExpandable = '⍄'
"let g:NERDTreeDirArrowCollapsible = '⍌'
let g:NERDTreeDirArrowExpandable = 'ᐅ'
let g:NERDTreeDirArrowCollapsible = 'ᐁ'
"let g:NERDTreeDirArrowExpandable = 'ᐳ'
"let g:NERDTreeDirArrowCollapsible = 'ᐯ'
" }}}


" [ Status Line - Vim-Airline] {{{

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
let g:airline#extensions#tabline#buffer_nr_show = 1

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
