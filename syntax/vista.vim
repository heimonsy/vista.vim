" Copyright (c) 2019 Liu-Cheng Xu
" MIT License
" vim: ts=2 sw=2 sts=2 et

if exists('b:current_syntax')
  finish
endif

syntax match VistaBracket /\(\[\|\]\)/ contained
syntax match VistaChildrenNr /\[\d*\]$/ contains=VistaBracket

let s:prefixes = filter(
      \ map(copy(vista#viewer#prefixes()), 'vista#util#Trim(v:val)'),
      \ '!empty(v:val)')
let s:pattern = join(s:prefixes, '\|')
execute 'syntax match VistaPrefix' '/\('.s:pattern.'\)/' 'contained'

syntax match VistaScope /^\S.*$/ contains=VistaPrefix,VistaChildrenNr
syntax match VistaColon /:/ contained
syntax match VistaLineNr /:\d*$/ contains=VistaColon
syntax region VistaTag start="^" end="$" contains=VistaLineNr,VistaScope,VistaPrefix

hi default link VistaBracket     Identifier
hi default link VistaChildrenNr  Number
hi default link VistaScope       Function
hi default link VistaTag         Keyword
hi default link VistaPrefix      String
hi default link VistaLineNr      LineNr
hi default link VistaColon       SpecialKey

let b:current_syntax = 'vista'
