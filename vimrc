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
	""let g:LargeFile = 1024 * 1024 * 1
	""if getfsize(expand("%")) > g:LargeFile
		"set eventignore+=FileType
		"setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1
		"set ft= syn=
		"syntax off
		"set nowrap
		""set runtimepath=
		""runtime! config/common/base.vim
		"set runtimepath=
	""else
		""set eventignore-=FileType
		""runtime! config/common/**
		""runtime! PROJECTS/**
	""endif
"endfunction

"augroup LargeFile
	"au!
	"autocmd BufReadPre * :call s:LargeFile()<CR>
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
"augroup END
"########################################################################

runtime! config/common/**
runtime! PROJECTS/**
