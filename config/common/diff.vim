" vim: set noet ci pi sts=0 sw=4 ts=4 :
""""""""""""""""""""""""""""""""    FILE   """"""""""""""""""""""""""""""""""""

" ===========  vimdiff   =================
" :sp <filename>
" :windo diffthis
function! SetDiffEnviron()
  set diff
  set scrollbind
  set scrollopt=ver,jump,hor
  set nowrap
  set fdm=diff
endfunction
":command! SetDiffEnviron call SetDiffEnviron()

" Switch off diff-mode of all currently open windows.
"command! DiffOff call DiffOff()
":diffoff
function! DiffOff()
  windo set nodiff
  windo set noscrollbind
  " Reset, then restore the 'foldmethod' and 'foldcolumn' settings by
  " re-setting the filetype. This triggers the filetype-based folding to be
  " reactivated, and ( contrary to a simple :e!) works even on modified
  " buffers.
  windo set foldmethod=manual
  windo set foldcolumn=0
  windo unlet! b:did_ftplugin | let &filetype = &filetype
endfunction
