" vim: set noet ci pi sts=0 sw=4 ts=4 :
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_bin_path = expand("~/PROJECTS/bin")
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

"DONT WORK !!!!!!!!!!!!!!!!!!!!!!!!!!!!! for gopls
let g:go_gocode_unimported_packages = 1
" let g:go_gocode_propose_source = 0

let g:go_fmt_experimental = 1

" let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment', 'comment']
let g:go_fold_enable = ['block']

" let g:go_debug_address = '127.0.0.1:8181'
" let g:go_debug_address = '127.0.0.1:40000'

" let g:go_def_mode='godef'
let g:go_def_mode='gopls'

" slow down autocompletion but work
" let g:go_gocode_propose_source=1

" hmmmmmm may be
" let g:go_gocode_propose_source=0
" autocmd BufWritePost *.go silent! :GoBuild -i

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_autosave_enabled = ['vet']
"
"
" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

augroup filetype_go
    autocmd!
    autocmd FileType go map <buffer> 'g <Plug>(go-def-tab)
    autocmd FileType go nmap <Leader><leader>a :GoAlternate<CR>
    autocmd FileType go nmap <Leader><leader>d :GoDeclsDir<CR>
    " autocmd FileType go nmap <Leader><leader>r :GoReferrers<CR>
    autocmd FileType go nmap <Leader><leader>r :GoRename<CR>
    autocmd FileType go nmap <Leader><leader>i :GoImplements<CR>
    " autocmd FileType go nmap <Leader><leader>e :GoWhicherrs<CR>
    autocmd FileType go nnoremap <leader>e :GoIfErr<CR>
    autocmd FileType go nmap <Leader><leader>c :GoChannelPeers<CR>
    " autocmd FileType go nmap <F9> :GoMetaLinter<CR>
    " for speed up autocomplete
    autocmd FileType go nmap <F9> :GoBuild -i <CR>
    autocmd FileType go nmap <F8> :GoImpl
augroup END

"------------------------------------------------------------------------
"
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
