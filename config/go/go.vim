" vim: set noet ci pi sts=0 sw=4 ts=4 :
function SetGoOptions()
    set foldmethod=indent
    "set foldlevel=1
    "set foldclose=all
endfunction

au FileType *.go call SetGoOptions()
au BufNewFile,BufRead *.go call SetGoOptions()
