" vim: set noet ci pi sts=0 sw=4 ts=4 :

"Add this to your .vimrc file:
autocmd FileType java setlocal omnifunc=javacomplete#Complete

""To enable smart (trying to guess import option) inserting class imports with F4, add:
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)

""To enable usual (will ask for import option) inserting class imports with F5, add:
"imap <F5> <Plug>(JavaComplete-Imports-Add)

""To add all missing imports with F6:
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

""To remove all unused imports with F7:
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
