
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
