" Vim syntax file
" Language:     Text
" Maintainer:   Benj Hingston
" Last Change:  2015 Nov 23

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful Text keywords
syn keyword     Title      goto break continue asm
syn keyword     Terms          case default
syn keyword     txtConditional    if else switch
syn keyword     txtRepeat         while for do
syn keyword     txtTodo           contained TODO FIXME XXX
