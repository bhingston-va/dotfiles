" Vim color file
"
" Author: Benj Hingston <bvhingston@yahoo.ca>
"
" Note: Based on the molokai theme for textmate

hi clear
set background=dark
let g:colors_name="earthAndFire"

" Basic Layout {{{
hi Normal          guifg=#F8F8F2 guibg=#1B1E1F
hi Folded          guifg=#666666 guibg=bg
"hi CursorLine                    guibg=#232728
hi CursorLine      guibg=darkred guifg=white
hi CursorColumn                  guibg=#232728
hi ColorColumn                   guibg=#232728
"hi LineNr          guifg=#AAAAAA guibg=bg
hi FoldColumn      guifg=#AAAAAA guibg=bg
hi VertSplit       guifg=#AAAAAA guibg=bg      gui=none
hi Search          guifg=#000000 guibg=#E4E500
hi IncSearch       guibg=#000000 guifg=#FF8D00
" }}}
"
" Syntax {{{
hi Boolean         guifg=#80a0ff
"hi Comment         guifg=#5c7176
hi Comment         guifg=#80a0ff               gui=bold
hi Character       guifg=#E6DB74
hi Number          guifg=#80a0ff
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
"hi Constant        guifg=#AE81FF               gui=bold
hi Constant        guifg=#80a0ff               gui=bold
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi Float           guifg=#80a0ff
hi Function        guifg=#A6E22E
"hi Identifier      guifg=#FD971F
hi Identifier      guifg=#80a0ff               gui=bold
hi Builtin         guifg=#80a0ff               gui=bold
" }}}
"
" Diffs {{{
hi DiffAdd                       guibg=#0F1D0B
hi DiffChange      guifg=#89807D guibg=#322F2D
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4A4340 gui=italic,bold
" }}}
"
" Cursor {{{
hi Cursor          guifg=#000000 guibg=#F35FBC
hi iCursor         guifg=#000000 guibg=#FDFF00
hi vCursor         guifg=#000000 guibg=#AAF412
" }}}

hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=#FFFFFF guibg=#604A8C
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#C50048

hi EasyMotionTarget guifg=#E4E500 guibg=bg gui=bold
hi EasyMotionShade  guifg=#444444 guibg=bg gui=bold
hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Ignore          guifg=#808080 guibg=bg

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi InterestingWord1 guifg=#000000 guibg=#FFA700
hi InterestingWord2 guifg=#000000 guibg=#53FF00
hi InterestingWord3 guifg=#000000 guibg=#FF74F8

hi MatchParen      guifg=#E4E400 guibg=#434748 gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" Completion Menu {{{
hi Pmenu           guifg=#cccccc guibg=#232728
hi PmenuSel        guifg=#000000 guibg=#AAF412
hi PmenuSbar                     guibg=#131414
hi PmenuThumb      guifg=#777777
" }}}

hi PreCondit       guifg=#A6E22E               gui=bold
"hi PreProc         guifg=#A6E22E
hi PreProc         guifg=#80a0ff               gui=bold
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold

" marks column
hi IndentGuides                  guibg=#373737
hi SignColumn      guifg=#A6E22E guibg=#151617
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
"hi Special         guifg=#66D9EF guibg=bg      gui=italic
hi Special         guifg=#80a0ff               gui=bold
hi SpecialKey      guifg=#888A85               gui=italic
"hi Statement       guifg=#F92672               gui=bold
hi Statement       guifg=#80a0ff               gui=bold
hi StatusLine      guifg=#CD5907 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#80a0ff               gui=italic
" Structure is the light blue color
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
"hi Type            guifg=#66D9EF               gui=none
hi Type            guifg=#80a0ff               gui=bold
"hi Underlined      guifg=#808080               gui=underline
hi Underlined      guifg=#80a0ff               gui=bold

hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi MyTagListFileName guifg=#F92672 guibg=bg gui=bold

" Spelling {{{
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
" }}}
" Visual Mode {{{
hi VisualNOS  guibg=#403D3D
hi Visual     guibg=#403D3D
" }}}
" Invisible character colors {{{
highlight NonText    guifg=#444444 guibg=bg
highlight SpecialKey guifg=#444444 guibg=bg
" }}}

" Support for 256-color terminals {{{
if &t_Co > 255
hi Constant           ctermfg=039               cterm=bold
   hi Boolean         ctermfg=039
   hi Character       ctermfg=144
   hi Number          ctermfg=039
"  hi Number          ctermfg=208
   hi String          ctermfg=039
   hi Float           ctermfg=039

hi Identifier         ctermfg=075               cterm=bold
   hi Function        ctermfg=088

hi Statement          ctermfg=228               cterm=none
   hi Conditional     ctermfg=124               cterm=none
   hi Repeat          ctermfg=124               cterm=none
   hi Label           ctermfg=229               cterm=none
   hi Operator        ctermfg=124               cterm=none
   hi Keyword         ctermfg=124               cterm=bold
   hi Exception       ctermfg=088               cterm=bold

hi PreProc            ctermfg=088               cterm=none
   hi Define          ctermfg=124
   hi Macro           ctermfg=124
   hi PreCondit       ctermfg=088               cterm=none

hi Type               ctermfg=123               cterm=bold
   hi StorageClass    ctermfg=033               cterm=bold
   hi Structure       ctermfg=208
   hi Typedef         ctermfg=194

hi Special            ctermfg=124               cterm=bold
   hi SpecialChar     ctermfg=088               cterm=none
   hi SpecialComment  ctermfg=240               cterm=bold
   hi SpecialKey      ctermfg=245
   hi Tag             ctermfg=124               cterm=bold
   hi Delimiter       ctermfg=241
   hi Debug           ctermfg=225               cterm=bold

hi Ignore             ctermfg=244 ctermbg=232

hi Error              ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=160 ctermbg=000   cterm=none

hi Todo               ctermfg=231 ctermbg=232   cterm=bold

   hi Builtin         ctermfg=039               cterm=none

   hi EasyMotionTarget ctermfg=11
   hi EasyMotionShade  ctermfg=8

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102   cterm=none

   hi Directory       ctermfg=088               cterm=bold
   hi FoldColumn      ctermfg=67  ctermbg=233
   hi Folded          ctermfg=67  ctermbg=233
   hi IncSearch       ctermfg=193 ctermbg=16

   hi SpecialKey      ctermfg=194
   hi MailHeaderEmail ctermfg=3   ctermbg=233
   hi MailEmail       ctermfg=3   ctermbg=233

   hi MatchParen    ctermfg=black ctermbg=cyan   cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229

   " complete menu
"  hi Pmenu           ctermfg=124 ctermbg=16
"  hi PmenuSel                    ctermbg=244
"  hi PmenuSbar                   ctermbg=232
"  hi PmenuThumb      ctermfg=124

   hi Question        ctermfg=124
   hi Search          ctermfg=165 ctermbg=0     cterm=none

   " marks column
"  hi SignColumn      ctermfg=088 ctermbg=235

"  hi StatusLine      ctermfg=238 ctermbg=253
"  hi StatusLineNC    ctermfg=244 ctermbg=232
   hi Title           ctermfg=166

   hi Underlined      ctermfg=100               cterm=underline

   " NOTE: @pfdevilliers added this shit
   " Not sure if this color with underlined was defined already
   " but I added it for the definition of a class that is a
   " subclass.
hi InheritUnderlined  ctermfg=088               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=none
"  hi VisualNOS                   ctermbg=238
"  hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=160 ctermbg=000   cterm=bold
   hi WildMenu        ctermfg=124  ctermbg=16

"  hi Normal          ctermfg=252 ctermbg=233
   hi Comment         ctermfg=238               cterm=none
   hi CursorLine                  ctermbg=233   cterm=none
   hi CursorColumn                ctermbg=232   cterm=NONE
   hi ColorColumn                 ctermbg=232
   hi LineNr          ctermfg=006 ctermbg=0     cterm=none
   hi NonText         ctermfg=240 ctermbg=233
end " }}}

" hi Visual term=none cterm=inverse guibg=Grey


" [ Config CursorLine & Background ] {{{

augroup Over80Grey
    autocmd!
    autocmd BufEnter  *.cc   execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.cc   :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.cpp  execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.cpp  :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.c    execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.c    :highlight ColorColumn ctermbg=233 guibg=lightgrey
    autocmd BufEnter  *.java execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd BufEnter  *.java :highlight ColorColumn ctermbg=233 guibg=lightgrey
augroup END

execute "set colorcolumn=" . join(range(81,335), ',')
:highlight ColorColumn ctermbg=233 guibg=lightgrey

"hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred guifg=white
"set colorcolumn=81
" }}}

" [ Highlight cursor (plus row and column on request) ] {{{

"" Inverse highlighting for cursor...
"highlight CursorInverse   term=inverse ctermfg=black ctermbg=cyan
"call matchadd('CursorInverse', '\%#', 100)
"
"" Need an invisible cursor column to make it update on every cursor move...
"highlight clear CursorColumn
"highlight CursorColumn term=none cterm=none
"set cursorcolumn
"" Show matching brackets when text indicator is over them
"" set showmatch
" }}}
