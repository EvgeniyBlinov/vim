" vim: set noet ci pi sts=0 sw=4 ts=4 :
"""  FISRT OF ALL
" Кодировка по умолчанию
scriptencoding utf-8
set encoding=utf-8
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   "set fileencodings=utf-8,latin1
"endif
" Список кодировок файлов для авто-определения
set fileencodings=utf-8,koi8-r,cp1251,cp866
" Кодировка терминала
set termencoding=utf-8
" Формат файла по умолчанию
set fileformat=unix
" Формат файла, который влияет на окончания строк — будет перебирать в
" указанном порядке
set ffs=unix,dos,mac

""""""""""""""""""""""""""""   ENCODING   """"""""""""""""""""""""""""""""""""

if exists("$AUTHOR_EMAIL") && !empty("$AUTHOR_EMAIL")
    let snips_author = 'Evgeniy Blinov <'.$AUTHOR_EMAIL.'>'
else
    let snips_author = 'Evgeniy Blinov <evgeniy_blinov@mail.ru>'
endif

" Сочитание для Leader
let mapleader = ","

set confirm " использовать диалоги вместо сообщений об ошибках
set novb " Отключить оповещение об ошибка
set shortmess+=I " И нет детей Уганды


set nocompatible				" Use Vim defaults (much better!)
set viminfo='20,\"50			" read/write a .viminfo file, don't store more
								" than 50 lines of registers
set history=128					" Хранить больше истории команд ...
set undolevels=2048				" ... и правок
" set undofile					" Сохранение undo после закрытия файла
" set undodir=~/.vim/undo/
set ttyfast " ускорение открытия файлов

"set backup 					" keep a backup file
set nobackup			" Запретить создание бэкапов
set nowritebackup
set noswapfile			" Запретить создание swap файлов

set ruler						" Всегда показывать положение курсора
set nu

set list				" Отображение спецсимволов
	"set listchars=tab:→→,trail:·,nbsp:~
	set listchars=tab:│┈,trail:·,nbsp:~

""""""""""""""""""""""""""""   from coc.vim  """""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set ignorecase				" Игнорирование регистра при поиске
set incsearch               " Перескакивать на найденные слова

""""""""""""""""""""""""""""   from coc.vim  """""""""""""""""""""""""""""""""

set nowrap				" Отключение переноса длинных строк
set infercase           " предлагать авто-дополнение на основе уже введённого регистра
""""""""""""""""""""""""""""   from coc.vim  """""""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
	" In text files, always limit the width of text to 78 characters
	" autocmd BufRead *.txt,*.php set tw=78

	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\	exe "normal! g'\"" |
	\ endif
  augroup END
endif

"Vim Modelines Shell Command Injection Vulnerability disable
set modelines=0
