" [ colorschemes ] {{{
"colorscheme FireCode
"au BufReadPost *.twig colorscheme koehler
"au BufReadPost *.css colorscheme slate
"au BufReadPost *.js colorscheme elflord
"au BufReadPost *.ts colorscheme elflord
"au BufReadPost *.py colorscheme earthAndFire
"au BufReadPost *.html colorscheme monokai
"au BufReadPost *.java colorscheme monokai
"au BufReadPost *.java colorscheme koehler " really like this one
"au BufReadPost *.java colorscheme peachpuff
"au BufReadPost *.java colorscheme slate   " this is okay
"au BufReadPost *.java colorscheme zellner
"au BufReadPost *.php colorscheme monokai
"au BufReadPost *.java colorscheme earthAndFire " this is mine
"au BufReadPost *.cc   colorscheme earthAndFire " this is mine
"au BufReadPost *.cpp  colorscheme earthAndFire " this is mine
"au BufReadPost *.go  colorscheme earthAndFire " this is mine
"au BufReadPost *.js  colorscheme earthAndFire " this is mine
"au BufReadPost *.ts  colorscheme earthAndFire " this is mine
" }}}


" [ Config Syntax Highlighting ] {{{
set bg=dark
hi Comment    cterm=none ctermfg=238
hi Type       cterm=bold ctermfg=123 " Type
hi PreProc    cterm=none ctermfg=088 " bold
hi Special    cterm=none ctermfg=124 " <ESC>
hi Statement  cterm=none ctermfg=228 " hi 172,166,214,195,230,145,124
hi Identifier cterm=bold ctermfg=075 " a:newstate
hi Constant   cterm=none ctermfg=039 " 039
hi Underlined cterm=none ctermfg=100
hi LineNr ctermfg=006 ctermbg=0 cterm=none
" }}}

