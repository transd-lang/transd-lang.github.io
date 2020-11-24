" Vim syntax file
" Language:         Transd
" Maintainer:       Albert Berger <alberger@gmail.com>
" Latest Revision:  24-Nov-2020

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn match op /[!+-<>/]\?[=]\?/

syn keyword standardName      	 _start mainModule
syn keyword kword       	while in for try catch throw with where through
syn keyword native		Int Double Bool Null String Vector Index Directory Range
syn keyword native		StringStream
syn keyword kword	        break continue select public module if else elsif to
syn keyword specField		import

syn match delim /[{}(),\[\]]/
syn region name matchgroup=delim start=/[{,]/ end=/:/ contains=varname,standardName
syn region array matchgroup=delim start=/\[/ end=/\]/ contains=tdNumber,varname
syn region string start=/"/ skip=/\\"/ end=/"/
syn region funcname matchgroup=delim start=/(\s*\I\@=/ end=/[\W ()]/ contains=kword,varname,op

syn match tdNumber "[-+]\=[0-9]\+\(\.[0-9]*\)\=\(e[-+]\=[0-9]\+\)\=\>"

syn match   Sheb 		/\#lang transd/

syn match varname / \@<=\I\i*\%[\ \(\)]/
syn region cmnt start="/\*" end="\*/" 

hi def link Sheb        		PreProc
hi def link standardName     		Keyword
hi def link builtin 			Keyword
hi def link native 			Keyword
hi def link kword 			Special
hi def link name 			Identifier
hi def link varname 			Identifier
hi def link funcname 			Function
hi def link specField     		PreProc
hi def link string      		String
hi def link delim      			Delimiter
hi def link tdNumber			Number
hi def link op				Operator
hi def link cmnt			Comment

let b:current_syntax = "transd"

let &cpo = s:cpo_save
unlet s:cpo_save
