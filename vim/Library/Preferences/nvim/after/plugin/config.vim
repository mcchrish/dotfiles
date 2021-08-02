autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | startinsert | endif
autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif
