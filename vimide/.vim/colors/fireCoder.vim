hi clear
if exists("syntax_on")
  syntax reset
endif

set bg=dark

let g:colors_name = "fire-coder"

" :help syntax.txt

" invoke: call Coloring('Comment', 'None', '1', '2', '#4', '#5')
function! Coloring(group, cterm, ctermfg, ctermbg, guifg, guibg)
  let histr  = 'hi ' . a:group . ' '
  let histr .= 'ctermfg=' . a:ctermfg . ' '
  let histr .= 'ctermbg=' . a:ctermbg . ' '
  let histr .= 'cterm=' . a:cterm . ' '
  let histr .= 'guifg=' . a:guifg . ' '
  let histr .= 'guibg=' . a:guibg . ' '
  let histr .= 'gui=' . a:cterm . ' '

  execute histr
endfunction

" color pallette https://pintovim.dev/  vim-color-editor
" grays
let FireDarkerGray = '#222222'
let FireDarkGray   = '#444444'
let FireGrayMed    = '#6c6c6c'
let FireGray       = '#808080'
let FireLightGray  = '#c0c0c0'
let FireWhite      = '#d0d0d0'
let FireOffBlack   = '#080808'
let FireBlack      = '#000000'
" cyan|blue pair1
let FireCyan       = '#008080'
let FireCyanBright = '#00afd7'
let FireDarkBlue   = '#0087d7'
let FireLightBlue  = '#00afff'
" cyan|blue pair2
let FireCyanMed    = '#87d7d7'
let FireCyan2      = '#87ffff'
let FireBlue       = '#0087ff'
let FireBlueBright = '#afd7ff'
" yellow
let FireOrange       = '#d78700'
let FireYellow       = '#ffd75f'
let FireYellowBright = '#ffff87'
" red
let FireDarkRed = '#870000'
let FireRedMed  = '#af0000'
let FireRed     = '#d70000'
" slate cyan
let FireSlateDarkCyan  = '#0087af'
let FireSlateCyan      = '#00afaf'
let FireSlateLightCyan = '#00d7d7'
" slate blue
let FireSlateDarkBlue  = '#5f8787'
let FireSlateBlue      = '#5f87af'
let FireSlateLightBlue = '#5f87d7'

call Coloring('Comment',    'none', '238',  'none', FireDarkGray,     'none')
call Coloring('Type',       'bold', '123',  'none', FireCyan2,        'none')
call Coloring('PreProc',    'none', '088',  'none', FireDarkRed,      'none')
call Coloring('Special',    'none', '124',  'none', FireRedMed,       'none')
call Coloring('Statement',  'none', '228',  'none', FireYellowBright, 'none')
call Coloring('Identifier', 'bold', '075',  'none', FireLightBlue,    'none')
call Coloring('Constant',   'none', '039',  'none', FireDarkBlue,     'none')
call Coloring('Underlined', 'none', '100',  'none', FireYellow,       'none')
call Coloring('LineNr',     'none', '006',  '000',  FireCyan,         FireBlack)
call Coloring('Title',      'bold', '252',  'none', FireWhite,        'none')
call Coloring('Visual',     'bold', 'none', '238',  'none',           FireDarkerGray)
" menu
" defaults: ctermfg=0 ctermbg=13 guibg=Magenta
call Coloring('Pmenu', 'none', '242', '232', FireGrayMed, FireOffBlack)
" defaults: ctermfg=242 ctermbg=0 guibg=DarkGrey
call Coloring('PmenuSel', 'reverse', 'none', 'none', 'none', 'none')
" defaults: ctermbg=248 guibg=DarkGrey
call Coloring('PmenuSbar', 'none', 'none', '238', 'none', FireDarkGray)
" defaults: ctermfg=15 guibg=White
call Coloring('PmenuThumb', 'none', 'none', '006', 'none', FireBlack)
hi! link TabLine PmenuSbar

" All from :help syntax.txt
"*Comment	any comment
"
"*Constant	any constant
" String		a string constant: "this is a string"
" Character	a character constant: 'c', '\n'
" Number		a number constant: 234, 0xff
" Boolean	a boolean constant: TRUE, false
" Float		a floating point constant: 2.3e10
"
"*Identifier	any variable name
" Function	function name (also: methods for classes)
"
"*Statement	any statement
" Conditional	if, then, else, endif, switch, etc.
" Repeat		for, do, while, etc.
" Label		case, default, etc.
" Operator	"sizeof", "+", "*", etc.
" Keyword	any other keyword
" Exception	try, catch, throw
"
"*PreProc	generic Preprocessor
" Include	preprocessor #include
" Define		preprocessor #define
" Macro		same as Define
" PreCondit	preprocessor #if, #else, #endif, etc.
"
"*Type		int, long, char, etc.
" StorageClass	static, register, volatile, etc.
" Structure	struct, union, enum, etc.
" Typedef	A typedef
"
"*Special	any special symbol
" SpecialChar	special character in a constant
" Tag		you can use CTRL-] on this
" Delimiter	character that needs attention
" SpecialComment	special things inside a comment
" Debug		debugging statements
"
"*Underlined	text that stands out, HTML links
"
"*Ignore		left blank, hidden  |hl-Ignore|
"
"*Error		any erroneous construct
"
"*Todo		anything that needs extra attention; mostly the
"			keywords TODO FIXME and XXX
" to link groups: hi link x y

" comment 238 (gray)
" type 123, alt: 116, 117 (light blue)
" preproc 88, alt: 124, 52 (dark red)
" speical 124, alt: 203, 196 (red)
" statement 228, alt: 186, 178, 179, 172, 221 (yellow)
" identifier 75, (blue) see blue or cyan
" constant 39, (blue) see blue or cyan
" underlined 100, (orange) see orange

" blue (45, 150, 225) : 32, 38, 39, 33
" light blue (150, 215, 235) : 117, 116, 153, 152
" red (245, 50, 75) : 203 (196)
" dark red (115, 25, 30) : 124, 88, 52
" red 2 (240, 50, 60) : 160, 166, 167
" cyan (115, 195, 210) : 116, [110, 109, 111], [80, 81, 79], [73, 74, 75]
" white (250, 250, 240) : 231-243
" gray (170, 185, 200) : 7, 8, 244+
" orange (250, 150, 85) : 208, 214, 215, 221, 202
" yellow (230, 220, 115) : 186, 178, 179, 172, 221

" light cyan (0, 185, 185) : 37, 44, 31, 30
" dark cyan (0, 128, 128) : 6
" cyan 2 (100, 115, 135) : 66-69

" List of colours by name (palette)
" blue
" light blue
" red
" dark red
" cyan
" dark cyan
" light cyan
" cyan 2
" white
" gray
" orange
" yellow

" List of all 256 interested
" 6
" 30
" 31
" 32
" 33
" 37
" 38
" 39
" 44
" 52
" 66
" 67
" 69
" 73
" 74
" 75
" 79
" 80
" 81
" 88
" 109
" 110
" 111
" 116
" 117
" 124
" 152
" 153
" 160
" 166
" 167
" 172
" 178
" 179
" 186
" 196
" 202
" 203
" 208
" 214
" 215
" 221
"
