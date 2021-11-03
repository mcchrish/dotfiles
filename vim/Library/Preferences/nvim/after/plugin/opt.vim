" :h lua-highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

autocmd InsertEnter * ++once lua require("coq").Now "--shut-up"

cnoreabbrev fz FzfLua
cnoreabbrev pa FzfLua packadd

" Common typo
cnoreabbrev w; w
