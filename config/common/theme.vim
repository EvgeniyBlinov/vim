" vim: set noet ci pi sts=0 sw=4 ts=4 :

"@TODO
"if &background=="dark"
	""colorscheme happy_hacking
	"echo "dark"
"elseif &background=="light"
	""colorscheme habiLight
	"echo "light"
"endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
     colorscheme happy_hacking
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
