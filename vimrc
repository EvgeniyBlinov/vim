" vim: set noet ci pi sts=0 sw=4 ts=4 :
" https://github.com/rstacruz/cheatsheets/blob/master/vimscript.md
"
""""""""""  Multi config """""""""""""""""""""""""""
"env VIMDIR=myvim vim
"cat > $HOME/.vimrc <<- 'EOF'
"set runtimepath=$HOME/$VIMDIR,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/vimfiles/after
"so $HOME/$VIMDIR/vimrc
"EOF


"let $MYVIMRC = "$HOME/.vim/vimrc"
"" Автоматически перечитывать конфигурацию VIM после сохранения
"autocmd! bufwritepost $MYVIMRC source $MYVIMRC
""""""""""""""""""""""""""""   ENCODING   """"""""""""""""""""""""""""""""""""
"########################################################################
"autocmd BufWinEnter * if getfsize(expand("%")) > 10000000 | syntax off | endif
":let g:LargeFile=1
":e
" Protect large files from sourcing and other overhead.
" Files become read only
"if !exists("my_auto_commands_loaded")
  "let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowrite (file is read-only)
  " undolevels=-1 (no undo possible)

		"set eventignore+=FileType
		"setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1
		"set ft= syn=
		"syntax off
		"set nowrap
		""set runtimepath=
		""runtime! config/common/base.vim
		"set runtimepath=
"function! s:LargeFile()
"    let g:LargeFile = 1024 * 1024 * 1
"    if getfsize(expand("%")) > g:LargeFile
"        set eventignore+=FileType
"        setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1
"        set ft= syn=
"        syntax off
"        set nowrap
"        runtime! config/common/base.vim
"        set runtimepath=
"    else
"        "set eventignore-=FileType
"        runtime! config/common/**
"        runtime! PROJECTS/**
"    endif
"endfunction

"augroup LargeFile
    "au!
    "autocmd BufReadPre * call s:LargeFile()<CR>
"augroup END
	"if getfsize(expand("%")) > g:LargeFile
	"autocmd BufReadPre * let g:LargeFile = 1024 * 1024 * 1
		"\| au VimEnter * syntax off
		"\| set eventignore+=FileType
		"\| setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1
		"\| set ft= syn=
		"\| syntax off
		"\| set nowrap
		"\| set runtimepath=
		"set runtimepath=
		"runtime! config/common/base.vim
"########################################################################

runtime! config/common/**
runtime! PROJECTS/**

"###########################  GOLANG  ###################################
"let l:lanaguage = 'undefined'

""function SetGoOptions()
    ""set foldmethod=indent
    """"set foldlevel=1
    """"set foldclose=all
    ""map! <C-\> :vsp <CR>:exec("GoDef")<CR>
    """runtime! config/go/**
""endfunction

"au FileType *.go call let l:lanaguage = "go"
"au BufNewFile,BufRead *.go call let l:lanaguage = "go"

":if l:lanaguage == 'go'
":    echo &filetype
":    runtime! config/go/**
":endif
"if &filetype ==# 'go'
"if &filetype == 'go'
    "runtime! custom_config/go/**
"endif
"###########################  GOLANG  ###################################

"function LargeFile()
    "let f=getfsize(expand("<afile>"))
    "" file is large from 10mb
    "let g:LargeFile = 1024 * 1024 * 10
    "if f > g:LargeFile || f == -2
        "if !has('g:configs_loaded')
            "let g:configs_loaded = 1
            "" no syntax highlighting etc
            "set eventignore+=FileType
            "" save memory when other file is viewed
            "setlocal bufhidden=unload
            "" is read-only (write with :w new_filename)
            "setlocal buftype=nowrite
            "" no undo possible
            "setlocal undolevels=-1
            "" display message
            "autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
            "runtime! config/common/base.vim
            "set runtimepath=
        "endif
    "else
        "if !has('g:configs_loaded')
            "let g:configs_loaded = 1
            "runtime! config/common/**
            "runtime! PROJECTS/**
        "endif
    "endif
"endfunction

"call LargeFile()
"augroup LargeFile
 "autocmd BufReadPre * call LargeFile()
"augroup END
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
