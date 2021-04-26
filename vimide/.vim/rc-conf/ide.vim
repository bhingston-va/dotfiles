" IDE Features below
" NEEDS
" - definition and usage location (maybe ctags?) [Coc + LSP]
" - file and project text search (function, class, text, filename) [Rg + fzf]
" - tree directory [NERDTree]
" - debugger (breakpoints, play, stepper, evaluate) [vim-go for go, ? for typescript]
" - run/debug tests [vim-go for go, ? for typescript]
" - multi file edit [native buffers + Vim-Airline]
" - autocomplete [CoC + LSP]
" - uncommitted line edits (deletions, insertions, updated) [GitGutter]
" - git blame with indication of newest changes and time [Fugitive]
" WANTS
" - spell check with suggestions (spell check with vimrc opts, suggestions with ?)


" [ File tree - NERDTree ] {{{
" easy open nerd tree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
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

" [ Git - Gutter ] {{{
" update gutter on post write
autocmd BufWritePost * GitGutter
nnoremap <silent> <leader>b :Git blame --date=relative --color-by-age<CR>
let g:fugitive_dynamic_colors = 1

" better git diff aliasses
nnoremap <leader>gd :Gvdiff!<CR>
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
  let g:airline_section_a = airline#section#create_left(['mode','today'])
  let g:airline_section_b = airline#section#create_left(['branch','gitstats'])
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
" }}}


" [ FzF & vim-ripgrep ] {{{
" Custom search commands
" unmerged files: `vim $(git diff --name-only --diff-filter=U)` in commandline
command! GFilesConflicted call fzf#run(fzf#wrap({'source': 'git diff --name-only --diff-filter=U'}))
nnoremap <silent> <leader><space>g :GFilesConflicted<CR>
" recent files?
nnoremap <silent> <leader><space>r :FZFMru<CR>
" files in git repo with changes
nnoremap <silent> <leader><space>j :GFiles?<CR>
" files in git repo
nnoremap <silent> <leader><space>f :GFiles<CR>
" files in history
nnoremap <silent> <leader><space>h :History<CR>
" Jump to the existing buffer if possible
let g:fzf_buffers_jump = 1

" popups
let g:fzf_layout = {'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'Comment'} }

" matches highlighted
let g:rg_highlight = 1

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
" }}}

" [ in file navigation: Sneak ] {{{
let g:sneak#label = 1
" }}}
"
" [ buffer navigation: vim-maximizer] {{{
nnoremap <silent> <leader><C-m> :MaximizerToggle<CR>
" }}}

" [ vim-go ] {{{
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
" }}}

" [ Conquer of Completion ] {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>l  <Plug>(coc-format-selected)
nmap <leader>l  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}
