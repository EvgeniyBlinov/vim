" Vim color file
" A version of nuvola.vim colorscheme, original by Dr. J. Pfefferl
" I changed some colors and added some highlights for C and Vim 7

" vim: tw=0 ts=4 sw=4
" Maintainer:  Christian Habermann
" Email:       christian( at )habermann-net( point )de
" Version:     1.2
" History:     1.2: nicer colors for paren matching
"              1.1: Vim 7 support added (completion, spell checker, paren, tabs)
"              1.0: initial version
"
" Intro {{{1
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "habiLight"

" Normal {{{1
hi Normal ctermfg=black ctermbg=white guifg=black guibg=#F9F5F9

" Search {{{1
hi IncSearch cterm=UNDERLINE ctermfg=Black ctermbg=brown gui=UNDERLINE guifg=Black guibg=#FFE568
hi Search term=reverse cterm=UNDERLINE ctermfg=Black ctermbg=brown gui=NONE guifg=Black guibg=#FFE568

" Messages {{{1
hi ErrorMsg gui=BOLD guifg=#EB1513 guibg=NONE
hi! link WarningMsg ErrorMsg
hi ModeMsg gui=BOLD guifg=#0070ff guibg=NONE
hi MoreMsg guibg=NONE guifg=seagreen
hi! link Question MoreMsg

" Split area {{{1
hi StatusLine term=BOLD,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=BOLD guibg=#56A0EE guifg=white
hi StatusLineNC gui=NONE guibg=#56A0EE guifg=#E9E9F4
hi! link VertSplit StatusLineNC
hi WildMenu gui=UNDERLINE guifg=#56A0EE guibg=#E9E9F4

" Diff {{{1
hi DiffText   gui=NONE guifg=#f83010 guibg=#ffeae0 cterm=none ctermfg=none ctermbg=LightYellow
hi DiffChange gui=NONE guifg=#006800 guibg=#d0ffd0
hi DiffDelete gui=NONE guifg=#2020ff guibg=#c8f2ea
hi! link DiffAdd DiffDelete

" Cursor {{{1
hi Cursor       gui=none guifg=black guibg=orange
"hi lCursor      gui=NONE guifg=#f8f8f8 guibg=#8000ff
hi CursorIM     gui=NONE guifg=#f8f8f8 guibg=#8000ff

" Fold {{{1
hi Folded gui=NONE guibg=#B5EEB5 guifg=black
"hi FoldColumn gui=NONE guibg=#9FD29F guifg=black
hi! link FoldColumn Folded

" Other {{{1
hi Directory    gui=NONE guifg=#0000ff guibg=NONE
hi LineNr       gui=NONE guifg=#8080a0 guibg=NONE
hi NonText      gui=BOLD guifg=#4000ff guibg=#EFEFF7
"hi SpecialKey   gui=NONE guifg=#A35B00 guibg=NONE
hi Title         gui=BOLD guifg=#1014AD guibg=NONE
hi Visual term=reverse ctermfg=yellow ctermbg=black gui=NONE guifg=Black guibg=#BDDFFF
hi VisualNOS term=reverse ctermfg=yellow ctermbg=black gui=UNDERLINE guifg=Black guibg=#BDDFFF

" Syntax group {{{1
hi   Comment      term=BOLD        ctermfg=gray        cterm=italic        guifg=darkcyan

hi   String       term=UNDERLINE   ctermfg=darkgreen   guifg=#B91F49
hi   Constant     term=UNDERLINE   ctermfg=darkblue    guifg=#B91F49
hi   Function     term=UNDERLINE   ctermfg=black       cterm=bold        guifg=black

"hi   Error        term=REVERSE     ctermfg=red         ctermbg=9         guibg=Red           guifg=White
hi   Error        term=REVERSE     ctermfg=red         ctermbg=white         guibg=Red           guifg=White
hi   Identifier   term=UNDERLINE   ctermfg=darkred     guifg=black
hi   Special      term=BOLD        ctermfg=darkred     guifg=red2
"hi   PreProc      term=UNDERLINE   ctermfg=darkblue    guifg=#1071CE
hi   Tag          term=BOLD        ctermfg=DarkGreen   guifg=DarkGreen
hi   Todo         term=STANDOUT    ctermbg=Yellow      ctermfg=blue      guifg=Blue          guibg=Yellow
hi   Type         term=UNDERLINE   ctermfg=blue        gui=NONE          guifg=Blue
hi   Statement    term=BOLD         ctermfg=darkblue   cterm=bold        gui=NONE          guifg=#F06F00
hi   Operator    term=BOLD         ctermfg=darkblue    gui=NONE          guifg=#F06F00

hi!   link   String           	 String
hi!   link   Number           	 String
hi!   link   Character        	 Constant
hi!   link   Boolean          	 Constant
hi!   link   Float            	 Number

hi!   link   Function         	 Function

hi!   link   Conditional      	 Statement
hi!   link   Repeat           	 Statement
hi!   link   Label            	 Statement
"hi!   link   Operator         	 Statement
hi!   link   Keyword          	 Statement
hi!   link   Exception        	 Statement

hi!   link   Structure        	 Statement
hi!   link   PreProc          	 Statement
hi!   link   Include          	 Statement
hi!   link   Define           	 Statement
hi!   link   Macro            	 Statement
hi!   link   PreCondit        	 Statement
hi!   link   StorageClass     	 Type
hi!   link   Typedef          	 Type

hi!   link   SpecialChar      	 Function
hi!   link   Delimiter        	 Function
hi!   link   SpecialComment      Special
hi!   link   Debug            	 Special



"" EXAMPLE
"hi! link Comment DraculaComment
"hi! link Underlined DraculaFgUnderline
"hi! link Todo DraculaTodo

"hi! link Error DraculaError
"hi! link SpellBad DraculaErrorLine
"hi! link SpellLocal DraculaWarnLine
"hi! link SpellCap DraculaInfoLine
"hi! link SpellRare DraculaInfoLine

"hi! link Constant DraculaPurple
"hi! link String DraculaYellow
"hi! link Character DraculaPink
"hi! link Number Constant
"hi! link Boolean Constant
"hi! link Float Constant

"hi! link Identifier DraculaFg
"hi! link Function DraculaGreen

"hi! link Statement DraculaPink
"hi! link Conditional DraculaPink
"hi! link Repeat DraculaPink
"hi! link Label DraculaPink
"hi! link Operator DraculaPink
"hi! link Keyword DraculaPink
"hi! link Exception DraculaPink

"hi! link PreProc DraculaPink
"hi! link Include DraculaPink
"hi! link Define DraculaPink
"hi! link Macro DraculaPink
"hi! link PreCondit DraculaPink
"hi! link StorageClass DraculaPink
"hi! link Structure DraculaPink
"hi! link Typedef DraculaPink

"hi! link Type DraculaCyanItalic

"hi! link Delimiter DraculaFg

"hi! link Special DraculaPink
"hi! link SpecialComment DraculaCyanItalic
"hi! link Tag DraculaCyan
"hi! link helpHyperTextJump DraculaLink
"hi! link helpCommand DraculaPurple
"hi! link helpExample DraculaGreen
"hi! link helpBacktick Special


" HTML {{{1
hi htmlLink                 gui=UNDERLINE guifg=#0000ff guibg=NONE
hi htmlBold                 gui=BOLD
hi htmlBoldItalic           gui=BOLD,ITALIC
hi htmlBoldUnderline        gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic  gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic               gui=ITALIC
hi htmlUnderline            gui=UNDERLINE
hi htmlUnderlineItalic      gui=UNDERLINE,ITALIC

" Tabs {{{1
highlight TabLine     term=underline cterm=underline ctermfg=0 ctermbg=7 gui=underline guibg=LightGrey
highlight TabLineFill term=reverse cterm=reverse gui=reverse
highlight TabLineSel  term=bold cterm=bold gui=bold

" Spell Checker {{{1
if v:version >= 700
    highlight SpellBad    term=reverse   ctermbg=12 gui=undercurl guisp=Red
    highlight SpellCap    term=reverse   ctermbg=9  gui=undercurl guisp=Blue
    highlight SpellRare   term=reverse   ctermbg=13 gui=undercurl guisp=Magenta
    highlight SpellLocale term=underline ctermbg=11 gui=undercurl guisp=DarkCyan
endif 

" Completion {{{1
highlight Pmenu      ctermbg=13  guifg=Black   guibg=#BDDFFF
highlight PmenuSel   ctermbg=7   guifg=Black   guibg=Orange
highlight PmenuSbar  ctermbg=7   guifg=#CCCCCC guibg=#CCCCCC
highlight PmenuThumb cterm=reverse  gui=reverse guifg=Black   guibg=#AAAAAA

" Misc {{{1
highlight KDE              guifg=magenta gui=NONE
highlight mySpecialSymbols guifg=magenta gui=NONE 


highlight MatchParen  term=reverse ctermbg=11 gui=bold guibg=#B5EEB5 guifg=black


" vim600:foldmethod=marker
" ########################################################################
" Author yeerkunth@gmail.com
" Copyright 2012. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"
" go.vim: more Vim syntax file for Go.
"
" Usage: copy it to the ~/.vim/after/syntax/
" 
" Improvment:
"  	This file is a supplement for the origin go.vim.  
"   It supports 
"   1. Hightligt NOTE in the comments
"     let OPTION_NAME = 0
" Options:
"   There are some options for customizing the highlighting; the recommended
"   settings are the default values, but you can write:
"     let OPTION_NAME = 0
"   in your ~/.vimrc file to disable particular options. You can also write:
"     let OPTION_NAME = 1
"   to enable particular options. At present, all options default to on.
"
"   - go_highlight_operators
"     Highlights operators.
"   - go_highlight_functions
"     Highlights functions.
"   - go_highlight_methods
"     Highlights methods.
"   - go_highlight_structs
"     Highlights structs.

if !exists("go_highlight_operators")
	let go_highlight_operators = 1
endif

if !exists("go_highlight_functions")
	let go_highlight_functions = 1
endif

if !exists("go_highlight_methods")
	let go_highlight_methods = 1
endif

if !exists("go_highlight_structs")
	let go_highlight_structs = 1
endif

" Comments; their contents
syn keyword     goTodo              contained NOTE
hi def link     goTodo              Todo


" Operators; 
if go_highlight_operators != 0
	syn match goOperator /:=/
	syn match goOperator />=/
	syn match goOperator /<=/
	syn match goOperator /==/
	syn match goOperator /\s>\s/
	syn match goOperator /\s<\s/
	syn match goOperator /\s+\s/
	syn match goOperator /\s-\s/
	syn match goOperator /\s\*\s/
	syn match goOperator /\s\/\s/
	syn match goOperator /\s%\s/
endif
hi def link     goOperator         Operator

" Functions; 
if go_highlight_functions != 0
	syn match goFunction 	 		/\(func\s\+\)\@<=\w\+\((\)\@=/
	syn match goFunction 	 		/\()\s\+\)\@<=\w\+\((\)\@=/
endif
hi def link     goFunction         Function

" Methods; 
if go_highlight_methods != 0
	syn match goMethod 	 /\(\.\)\@<=\w\+\((\)\@=/
endif
hi def link     goMethod         Statement

" Structs; 
if go_highlight_structs != 0
	syn match goStruct 	 			/\(.\)\@<=\w\+\({\)\@=/
	syn match goStructDef 	 	/\(type\s\+\)\@<=\w\+\(\s\+struct\s\+{\)\@=/
endif
hi def link     goStruct         Statement
hi def link     goStructDef         Function
