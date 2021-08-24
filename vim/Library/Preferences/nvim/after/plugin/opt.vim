" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" :h lua-highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | startinsert | endif
autocmd BufLeave * if &buftype == 'terminal' | stopinsert | endif
