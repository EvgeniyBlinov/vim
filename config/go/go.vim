" vim: set noet ci pi sts=0 sw=4 ts=4 :
"function SetGoOptions()
    "set foldmethod=indent
    "set foldlevel=1
    "set foldclose=all
    map! <C-\> :vsp <CR>:GoDef<CR>
"endfunction

"au FileType *.go call SetGoOptions()
"au BufNewFile,BufRead *.go call SetGoOptions()

let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

map <C-i> :GoInfo<CR>
imap <C-i> :GoInfo<CR>
nmap <C-i> :GoInfo<CR>
vmap <C-i> :GoInfo<CR>

map <C-\> :vsp <CR>:GoDef<CR>
imap <C-\> :vsp <CR>:GoDef<CR>
nmap <C-\> :vsp <CR>:GoDef<CR>
vmap <C-\> :vsp <CR>:GoDef<CR>

imap <leader>f :GoFmt<cr>
map  <leader>f :GoFmt<cr>
vmap <leader>f :GoFmt<cr>

let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
