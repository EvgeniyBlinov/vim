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



" tabs
"set noet ci pi sts=0 sw=4 ts=4
""""""""""" equal
"set noexpandtab
"set copyindent
"set preserveindent
"set softtabstop=0
"set shiftwidth=4
"set tabstop=4

set smarttab
set shiftround
" set noexpandtab | retab! "конверт пробелов в табы
set expandtab

" Двигать блоки в визуальном режиме на 4 пробела с помощью клавиш < и >
set softtabstop=4
set shiftwidth=4

" Настройки табуляции табуляция равна 4 пробелам
set tabstop=4

" Автоотступы для новых строк
set autoindent
set nosmartindent

" Заставляем BackSpace работать как x, т.е. удалять предыдущий символ
set backspace=indent,eol,start whichwrap+=<,>,[,]

