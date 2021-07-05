

"function! MyKeyMapHighlight()
   "if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
      "hi StatusLine ctermfg=White guifg=White
   "else " а при русской - зеленого.
      "hi StatusLine ctermfg=DarkRed guifg=DarkRed
   "endif
"endfunction
"call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
"autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках

"" использовать Ctrl+F для переключения раскладок
"cmap <silent> <C-F> <C-^>
"imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

"function! SetSpecialChars()
    "set list
    "set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
"endfunction
