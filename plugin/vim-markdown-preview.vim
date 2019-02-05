"  vim: set et fenc=utf-8 ff=unix sts=4 sw=4 ts=4 :
let $VIMHOME = $HOME."/.vim"
let g:vmp_script_path = resolve(expand('<sfile>:p:h'))

let g:vmp_osname = 'unix'

if !exists("g:vim_markdown_preview_browser")
    "let g:vim_markdown_preview_browser = 'Google Chrome'
    let g:vim_markdown_preview_browser = 'Mozilla Firefox'
endif

if !exists("g:vim_markdown_preview_temp_file")
    let g:vim_markdown_preview_temp_file = 1
endif

if !exists("g:vim_markdown_preview_toggle")
    let g:vim_markdown_preview_toggle = 0
endif

if !exists("g:vim_markdown_preview_github")
    let g:vim_markdown_preview_github = 0
endif

if !exists("g:vim_markdown_preview_perl")
    let g:vim_markdown_preview_perl = 1
endif

if !exists("g:vim_markdown_preview_pandoc")
    let g:vim_markdown_preview_pandoc = 0
endif

if !exists("g:vim_markdown_preview_use_xdg_open")
    let g:vim_markdown_preview_use_xdg_open = 0
endif

if !exists("g:vim_markdown_preview_hotkey")
    let g:vim_markdown_preview_hotkey='<C-p>'
endif

function! Vim_Markdown_Preview()
    write
    let b:curr_file = expand('%:p')

    if g:vim_markdown_preview_github == 1
        call system('grip "' . b:curr_file . '" --export /tmp/vim-markdown-preview.html --title vim-markdown-preview.html')
    elseif g:vim_markdown_preview_perl == 1
        let g:vim_markdown_preview_w_title = 'vim-markdown'
        let g:vim_markdown_preview_file = '/tmp/vim-markdown-preview.html'
        call system('echo "<!DOCTYPE html><html><head><meta charset=\"UTF-8\" /><title>' . g:vim_markdown_preview_w_title . '</title></head><body>" > ' . g:vim_markdown_preview_file . '.1')
        call system($VIMHOME . '/bin/Markdown.pl "' . b:curr_file . '" > ' . g:vim_markdown_preview_file . '.2')
        call system('echo "</body></html>" > ' . g:vim_markdown_preview_file . '.3')
        call system('cat ' . g:vim_markdown_preview_file . '.* > ' . g:vim_markdown_preview_file)
    elseif g:vim_markdown_preview_pandoc == 1
        call system('pandoc --standalone "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
    else
        call system('markdown "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
    endif
    if v:shell_error
        echo 'Please install the necessary requirements: https://github.com/JamshedVesuna/vim-markdown-preview#requirements'
    endif

    let curr_wid = system('xdotool getwindowfocus')
    let chrome_wid = system("xdotool search --name '" . g:vim_markdown_preview_w_title . " - " . g:vim_markdown_preview_browser . "'")
    if !chrome_wid
        if g:vim_markdown_preview_use_xdg_open == 1
            call system('xdg-open /tmp/vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
        else
            call system('see /tmp/vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
        endif
    else
        call system('xdotool windowmap ' . chrome_wid)
        call system('xdotool windowactivate ' . chrome_wid)
        call system("xdotool key 'ctrl+r'")
    endif
    call system('xdotool windowactivate ' . curr_wid)

    if g:vim_markdown_preview_temp_file == 1
        sleep 200m
        call system('rm /tmp/vim-markdown-preview.html.*')
        call system('rm /tmp/vim-markdown-preview.html')
    endif
endfunction

if g:vim_markdown_preview_toggle == 0
    "Maps vim_markdown_preview_hotkey to Vim_Markdown_Preview()
    :exec 'autocmd Filetype markdown,md map <buffer> ' . g:vim_markdown_preview_hotkey . ' :call Vim_Markdown_Preview()<CR>'
elseif g:vim_markdown_preview_toggle == 1
    "Automatically call Vim_Markdown_Preview() on buffer write
    autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
endif
