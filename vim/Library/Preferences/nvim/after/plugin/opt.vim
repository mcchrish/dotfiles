" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" :h lua-highlight
autocmd TextYankPost * silent! lua vim.highlight.on_yank()

autocmd InsertEnter * ++once lua require("coq").Now "--shut-up"

autocmd ColorSchemePre * lua require("mcchrish.feline").setup()

cnoreabbrev fz FzfLua
cnoreabbrev pa FzfLua packadd
