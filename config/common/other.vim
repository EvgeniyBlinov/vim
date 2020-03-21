" vim: set noet ci pi sts=0 sw=4 ts=4 :
""""""""""""""""""""""""""""""""    FILE   """"""""""""""""""""""""""""""""""""


" set background=dark		" Использование цветов для темного фона
"set background=light
set foldenable 			" Фолдинг сворачивание кода
set foldmethod=manual
"set foldmethod=indent
"set foldmethod=marker
"set foldmarker={,}

" Сохранение и восстановление фолдинга
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

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

" Term
if &term =~ "xterm"
	set t_Co=256			" set 256 colors
" 	colorscheme vitamins
	" Подсветка спец символов
	autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=8
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Syntax highlighting enables.
"if has("syntax")
""syntax on
"endif


" old regex engine for fast filetype parsing
set re=1


filetype on
filetype plugin indent on " определять подсветку на основе кода файла
augroup filetype
	autocmd BufNewFile,BufRead <Directory Path>/*.html set filetype=php
	autocmd BufRead,BufNewFile *.vue set filetype=html
augroup END

set ignorecase				" Игнорирование регистра при поиске
set incsearch               " Перескакивать на найденные слова


" Установка английских диалогов
if has('unix')
    language messages C
else
    language messages en
endif
" Не работает правильно!
"let $LANG = 'en'
"set langmenu=en_US.UTF-8

" Языковые установ" Языковые
set keymap=russian-jcukenwin
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

" По умолчанию латинская раскладка
set iminsert=0
" По умолчанию латинская раскладка при поиске
set imsearch=0
" Работа с русскими словами (чтобы w, b, * понимали русские слова)
set iskeyword=@,48-57,_,192-255
" Проверка орфографии
set spelllang=ru_yo,en_us
" помощь на русском
" set helplang=ru

" Всегда отображать командную строку
set laststatus=2

set splitright

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

" ======= МЫШЬ========
" Изменить цвет курсора в консоли при изменении режима ввода

" Включение поддержки мыши
set mouse+=a
"if &term =~ '^screen'
    "" tmux knows the extended mouse mode
    "set ttymouse=xterm2
"endif
if !has('nvim')
	if has("mouse_sgr")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	end
end
set mousemodel=popup

" Прятать курсор при наборе текста
set mousehide

" Разрешить визуальное выделение мышью
"set mouse=nvir
" ======= МЫШЬ=======


" tabs
"set noet ci pi sts=0 sw=4 ts=4
""""""""""" equal
"set noexpandtab
"set copyindent
"set preserveindent
"set softtabstop=0
"set shiftwidth=4
"set tabstop=4

" Настройки табуляции табуляция равна 4 пробелам
"set tabstop=4
" Двигать блоки в визуальном режиме на 4 пробела с помощью клавиш < и >
"set shiftwidth=4
"set softtabstop=4
set smarttab
set shiftround
" set noexpandtab | retab! "конверт пробелов в табы
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
" Автоотступы для новых строк
set autoindent
set nosmartindent

" Заставляем BackSpace работать как x, т.е. удалять предыдущий символ
set backspace=indent,eol,start whichwrap+=<,>,[,]

function! MyKeyMapHighlight()
   if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
      hi StatusLine ctermfg=White guifg=White
   else " а при русской - зеленого.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
" использовать Ctrl+F для переключения раскладок
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv


" C-e - комментировать/раскомментировать (при помощи NERD_Comment)
"map <C-e> ,ci
"nmap <C-e> ,ci
"imap <C-e> <ESC>,cii


" =================== HOTKEYS ================

" Открытие конфига по ,v
map <silent><leader>v :tabf ~/.vim/vimrc<cr>

" При отступах не снимать выделение
vnoremap < <gv
vnoremap > >gv

" При редактировании файлов с длинными строками курсор часто «скачет» и передвигается не туда, куда хотелось бы.
" Сделаем, чтобы поведение курсора было похоже на обычные текстовые редакторы
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"imap <leader>z <c-y><leader>
"map <leader>z <c-y><leader>
"vmap <leader>z <c-y><leader>

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
nmap <PAGEUP> <C-U><C-U>
nmap <PAGEDOWN> <C-D><C-D>
imap <PAGEUP> <C-O><C-U><C-O><C-U>
imap <PAGEDOWN> <C-O><C-D><C-O><C-D>
vmap <PAGEUP> <C-U><C-U>
vmap <PAGEDOWN> <C-D><C-D>

" Переназначение Home http://vim.wikia.com/wiki/Smart_home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' :'^'
imap <silent> <Home> <C-O><Home>

" Отменить-вернуть через Ctrl
" отмена действия
map <c-z> u
imap <c-z> <C-O>u

" вернуть отменённое назад
noremap <c-y> <C-R>
inoremap <c-y> <C-O><C-R>

" Так как мы включили autoindent, то вставка текста с отступами (из буфера обмена X Window или screen) 
" будет «глючить» — отсупы будут «съезжать». К счастью, это легко исправить — нажав Ctrl+U сразу после вставки.
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

" убрать подсветку найденных совпадений
nnoremap <C-h> :noh<CR>

" ====================  TABS  ============================================
" {{{ Вкладки
" Новая вкладка
nmap <silent> <leader>tn :tabnew<cr>
nmap ,t :tabnew<CR>

" Закрыть вкладку
nmap <silent> <leader>tc :tabclose<cr>

" Предыдущая вкладка
map  <C-S-left> :tabp<cr>
nmap <C-S-left> :tabp<cr>
imap <C-S-left> <esc>:tabp<cr>i

" Следующая вкладка
map  <C-S-right> :tabn<cr>
nmap <C-S-right> :tabn<cr>
imap <C-S-right> <esc>:tabn<cr>i

" }}}
" Переключение табов (вкладок) с помощью SHIFT+TAB и CTRL+TAB
map  <S-TAB> :tabprevious<CR>
nmap <S-TAB> :tabprevious<CR>
imap <S-TAB> <Esc>:tabprevious<CR>i
map  <C-TAB> :tabnext<CR>
nmap <C-TAB> :tabnext<CR>
imap <C-TAB> <Esc>:tabnext<CR>i

" Открытие\закрытие новой вкладки по CTRL+T и CTRL+W
" nmap <C-t> :tabnew<CR>
" imap <C-t> <Esc>:tabnew<CR>a
" nmap <C-w> :tabclose<CR>
" imap <C-w> <Esc>:tabclose<CR>

" Перемещение между окнами по Ctrl+Стрелки
if has('gui_macvim')
	map  <a-down> <c-w><down>
	imap <a-down> <esc><c-w><c-down>
	map  <a-up> <c-w><up>
	imap <a-up> <esc><c-w><c-up>
	map  <a-left> <c-w><left>
	imap <a-left> <esc><c-w><c-left>
	map  <a-right> <c-w><right>
	imap <a-right> <esc><c-w><c-right>
else
	map  <c-down> <c-w><down>
	imap <c-down> <esc><c-w><c-down>
	map  <c-up> <c-w><up>
	imap <c-up> <esc><c-w><c-up>
	map  <c-left> <c-w><left>
	imap <c-left> <esc><c-w><c-left>
	map  <c-right> <c-w><right>
	imap <c-right> <esc><c-w><c-right>
endif

" передвинуть текущую вкладку вправо
nnoremap tm :tabm +10<CR>

" передвинуть текущую вкладку влево
nnoremap tM :tabm -10<CR>

" увеличить окно
nnoremap wm :vertical resize +80% <CR>:resize +80% <CR>
" уменьшить окно
nnoremap wM :vertical resize -80% <CR>:resize -80% <CR>

" window zoom | restore c-w-=
nnoremap wz <c-w>\|<c-w>_
" ====================  TABS  ============================================

" Автодополнение слова
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


" Автоматизация {{{
" Aвтозавершение слов по tab =)
"function InsertTabWrapper()
 "let col = col('.') - 1
  "if !col || getline('.')[col - 1] !~ '\k'
    "return "\<tab>"
  "else
    "return "\<c-p>"
  "endif
"endfunction
"imap <c-a> <c-r>=InsertTabWrapper()<cr>
" }}}

" Yii {{{
	" поиск по ключевым словам (что позволяет нажмите <Sk> на любое ключевое
	" слово)
    " @TODO
	" autocmd BufNewFile,Bufread *.php set keywordprg="help"
" 

"http://www.instanceof.ru/linux/vim/translate
"map <F8>  :call TRANSLATE()<cr>
"function TRANSLATE()
"   let  a=getline('.')
"   let co=col('.')-1
"   let starts=strridx(a," ",co)
"   let ends = stridx(a," ",co)
"   if ends==-1
"	   let ends=strlen(a)
"   endif
"   let res = strpart(a,starts+1,ends-starts)
"   let cmds = "sdcv -n " . res
"   let out = system(cmds)
"   echo out
"endfunction

if &term =~ "xterm" || &term =~ "xterm-256color" 
	let &t_SI = "\<Esc>]12;red\x7"
	let &t_EI = "\<Esc>]12;blue\x7"
endif

" Настройки подсветки отступов
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_color_change_percent = 5
"let g:indent_guides_guide_size = 1

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd	guibg=grey18 ctermbg=4
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey18 ctermbg=4

""""""""""""""""""""""""""""""""""""""""""""""""""""
"" блок меню
"set wildmenu
"set wcm=<Tab>
"
"	" Меню Encoding -->
"		" Выбор кодировки, в которой читать файл -->
"			set wildmenu
"			set wcm=<Tab>
"			menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
"			menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
"			menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
"			menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
"			map <F9> :emenu Encoding.Read.<TAB>
"		" Выбор кодировки, в которой читать файл <--
"
"		" Выбор кодировки, в которой сохранять файл -->
"			set wildmenu
"			set wcm=<Tab>
"			menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
"			menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
"			menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
"			menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
"			map <S-F9> :emenu Encoding.Write.<TAB>
"		" Выбор кодировки, в которой сохранять файл <--
"
"		" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
"			set wildmenu
"			set wcm=<Tab>
"			menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
"			menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
"			menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
"			map <C-F9> :emenu Encoding.End_line_format.<TAB>
"		" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
"	" Меню Encoding <--
"
"	" Включение автоматического разбиения строки на несколько
"	" строк фиксированной длины
"		menu Textwidth.off :set textwidth=0<CR>
"		menu Textwidth.on :set textwidth=178<CR>
"
""map <F12> :emenu Encoding.<Tab>
"" блок меню
"
""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------
" ctags
"-------------------------
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tjump ".expand("<cword>"))<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------
" PHP настройки
"-------------------------
runtime! config/php/**
runtime! config/go/**
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"============CSS block================
" Сортировка css свойств
noremap <silent><leader>ss <esc>vi{:!sort<cr>:echo "Свойства css отсортированы!"<cr>
" Форматирование css
noremap <silent><leader>ct <esc>:%!/usr/share/vim/cssformatter.py<cr>:echo "Свойства css отформатированы!"<cr>

" Emmet
let g:user_emmet_leader_key='<C-e>'

" Zencoding 
imap <leader>z <c-y><leader>
map <leader>z <c-y><leader>
vmap <leader>z <c-y><leader>
"============END CSS block================
""""""""""""""""""""""""""""""   NERDTree
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowHidden=1
"let NERDTreeChDirMode=2
"let NERDTreeDirArrows=1
map  <F3> :NERDTreeFind<CR>

"if has("gui_running")
	"set cursorline							" Подсвечивать текущую строку в GUI режиме
	"au VimEnter * NERDTree /home/www/		" Автоматическое открытие NERDTree
	"let NERDTreeHighlightCursorline=1		" Подсветка файла под курсором
"else
	"set nocursorline						" Не подсвечивать текущую строку в консоли
	"let NERDTreeHighlightCursorline=0		" Отключение подсветки файла под курсором
"endif

nnoremap <silent> <C-f> :<C-u>if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr() <Bar> wincmd p <Bar> endif <Bar> FufTag<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==================   dragvisulas.vim ==========================
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
" ==================   dragvisulas.vim ==========================

map  <C-c> :call system('xclip -selection c -i', @")<CR>
vmap <C-c> :call system('xclip -selection c -i', @")<CR>
imap <C-c> :call system('xclip -selection c -i', @")<CR>

" Скопировать в буфер обмена текущее имя файла и номер строки
map  <C-l> :call system('xclip -selection c -i', expand("%:p") . ':' . line('.'))<CR>
vmap <C-l> :call system('xclip -selection c -i', expand("%:p") . ':' . line('.'))<CR>
imap <C-l> :call system('xclip -selection c -i', expand("%:p") . ':' . line('.'))<CR>
" Старый формат
"map  <C-l> :call system('xclip -selection c -i', expand("%:p") . ' +' . line('.'))
"vmap <C-l> :call system('xclip -selection c -i', expand("%:p") . ' +' . line('.'))
"imap <C-l> :call system('xclip -selection c -i', expand("%:p") . ' +' . line('.'))

" Mapping xclip clipboard support
 if has("unix")
   let s:uname = system("uname -s")
   if s:uname =~ "Darwin"
     " On OSX
     vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
     "nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>
   endif
   if s:uname =~ "Linux"
     " On Linux
     " Without X server it will just use a temporal file
     "if system("echo $DISPLAY") =~ ""
       "vmap <C-c> y: call system("> /tmp/theClipboardWithoutX", getreg("\""))<CR>
       ""map <C-v> :call setreg("\"", system("< /tmp/theClipboardWithoutX"))<CR>p
     "else
      " !!! Только это работает
       vmap <C-c> y: call system("xclip -i -selection primary", getreg("\""))<CR>
       "vmap <C-p> y: call system("dpaste", getreg("\""))<CR>
       "map <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
     "endif
   endif
 endif
":set clipboard=unnamed,exclude:cons\\\|linux

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Change selected text from NameLikeThis to name_like_this.
"vnoremap ,u :%s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#gul

" Change selected text from name_like_this to NameLikeThis.
"vnoremap ,U :s/_\([a-z]\)/\u\1/g<CR>gUl

" Вырезать-копировать-вставить через Ctrl
" CTRL-V вставить под курсором
" map <C-V> +gP

" CTRL-X - вырезать
" vnoremap <C-X> +x

" CTRL-C - копировать
" vnoremap <C-C> +y

" ========================================
"" Сохранить файл по <F2>
"nmap <F2> :w!<CR>
"imap <F2> <Esc>:w!<CR>
"vmap <F2> <Esc>:w!<CR>
"" Выйти из редактора по <F10>
"nmap <F10> :q<CR>
"imap <F10> <Esc>:q<CR>
"vmap <F10> <Esc>:q<CR>

"" Просмотр списка буферов по <F4>
nnoremap gb :ls<CR>:b<Space>
"nmap <F4> <Esc>:buffers<CR>
"vmap <F4> <Esc>:buffers<CR>
"imap <F4> <Esc><Esc>:buffers<CR>
"" предыдущий буфер
"map <F5> :bp<CR>
"vmap <F5> <Esc>:bp<CR>i
"imap <F5> <Esc>:bp<CR>i
"" следующий буфер
"map <F6> :bn<CR>
"vmap <F6> <Esc>:bn<CR>i
"imap <F6> <Esc>:bn<CR>i

"" Перейти в файл под курсором
nnoremap <F8> :vertical wincmd F<CR>
nnoremap <C-x> :vertical wincmd F<CR>
nnoremap <F9> :vnew


"set noautochdir

" ===========  ultisnips  =================
if exists('g:Ulti')
	let g:UltiSnipsExpandTrigger="<c-n>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endif
" ===========  supertab  =================
"let g:SuperTabNoCompleteAfter = ['^', '\s']
"let g:SuperTabCrMapping = 0
