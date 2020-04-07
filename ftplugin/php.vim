" vim: set noet ci pi sts=0 sw=4 ts=4 :
setl expandtab ts=4 sw=4 st=4

function! s:fileLineCount()
	return line('$')
endfunction

set dictionary=~/.vim/doc/php

" Сделаем удобную навигацию по мануалу PHP
set keywordprg=~/.vim/doc/php 

" Проверка синтаксиса PHP
set makeprg=php\ -l\ %

" Формат вывода ошибок PHP
set errorformat=%m\ in\ %f\ on\ line\ %l

"----------------  php-doc  ----------------------------
let g:pdv_cfg_Uses = 1
let g:pdv_cfg_Author = (exists("g:pdv_cfg_Author")) ? g:pdv_cfg_Author : g:snips_author


au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>
"----------------  php-doc  ----------------------------

" Vim постовляется с достаточно мощным плугином подстветки синтаксиса PHP.
" Помимо прочего он умеет:

"" Включаем фолдинг для блоков классов/функций
"" !!! ОЧЕНЬ СИЛЬНО ТОРМОЗИТ НА БОЛЬШИХ ФАЙЛАХ
let foldlevel = 20
let foldlevelstart = 20
au FileType php  if s:fileLineCount() < 1000
	\ |    let php_folding = 1
	\ |    else
	\ |    let php_folding = 0
	\ |    set nofoldenable!
	\ |    endif
"" 	map <F5> <Esc>:EnableFastPHPFolds<Cr> 
"" 	map <F6> <Esc>:EnablePHPFolds<Cr> 
"" 	map <F7> <Esc>:DisablePHPFolds<Cr> 

" Не использовать короткие теги PHP для поиска PHP блоков
let php_noShortTags = 1

" Подстветка SQL внутри PHP строк
let php_sql_query=1

" Подстветка HTML внутри PHP строк
let php_htmlInStrings=1 

" Подстветка базовых функций PHP
let php_baselib = 1


" PHP Documentor
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <C-P> :call PhpDocSingle()<CR> 
"vnoremap <C-P> :call PhpDocRange()<CR> 

" iabbrev _vd var_dump($);<left><left><C-R>

"А для того, что бы не отображать переменные в PHP-файлах, достаточно в .vimrc прописать строчку:
	let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
	let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
	"let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
	let Tlist_WinWidth = 30
" Automatically highlight the current tag in the taglist.
	let Tlist_Auto_Highlight_Tag = 1
" Open the taglist window when Vim starts.
	"let Tlist_Auto_Open = 1
" Automatically update the taglist to include newly edited files
	let Tlist_Auto_Update = 1
" Компактный вариант
	let Tlist_Compact_Format = 1
" Окно справа
	let Tlist_Use_Right_Window = 1
" Закрывать если одно окно Tlist
	let Tlist_Exit_OnlyWindow = 1
" Запуск/сокрытие плагина Tag List
" 	map <F4> :TlistToggle<CR>
" 	imap <F4> <Esc>:TlistToggle<CR>
" 	vmap <F4> <Esc>:TlistToggle<CR>

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

"" @TODO blinov 2017-06-29: for docker vdebug
"let g:vdebug_options["break_on_open"] = 0
""let g:vdebug_options["server"]='10.5.0.3'
""let g:vdebug_options["server"]='127.0.0.1'
""let g:vdebug_options["server"]='10.5.0.1'
""let g:vdebug_options["server"] = ''
"let g:vdebug_options["server"] = '172.19.0.1'
"let g:vdebug_options["debug_file"] = '~/vdebug.log'
"let g:vdebug_options["debug_file_level"] = 2

