" vim: set noet ci pi sts=0 sw=4 ts=4 :

" set background=dark		" Использование цветов для темного фона
"set background=light

"@TODO
"if &background=="dark"
	""colorscheme happy_hacking
	"echo "dark"
"elseif &background=="light"
	""colorscheme habiLight
	"echo "light"
"endif

"if &term=="xterm"
if &term=~"xterm"
	"set t_Co=8
	set t_Co=256			" set 256 colors
	set t_Sb=[4%dm
	set t_Sf=[3%dm
	colorscheme habiLight

	" Подсветка спец символов
	autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=8
elseif &term=="linux"
	set t_Co=8
	set t_Sb=[4%dm
	set t_Sf=[3%dm
	colorscheme happy_hacking
else
	set t_Co=256
	colorscheme habiLight
endif

"colorscheme default
