" :h lua-highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

cnoreabbrev fz FzfLua
cnoreabbrev pa FzfLua packadd

" Common typo
cnoreabbrev w; w
