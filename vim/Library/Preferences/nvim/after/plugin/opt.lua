-- :h lua-highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = vim.highlight.on_yank,
})
vim.cmd.cnoreabbrev "fz FzfLua"
vim.cmd.cnoreabbrev "pa FzfLua packadd"

-- Common typo
vim.cmd.cnoreabbrev "w; w"
