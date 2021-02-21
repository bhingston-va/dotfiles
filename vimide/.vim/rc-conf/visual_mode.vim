" [ Make Visual modes work better ] {{{
" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

vnoremap v <C-V>
vnoremap <C-V> v
vnoremap i I
vnoremap a A

" Quick exit
vnoremap <cr> <esc>
xnoremap <cr> <esc>

"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vnoremap <BS> x
" }}}
