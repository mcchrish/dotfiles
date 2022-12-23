-- :h lua-highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.cmd.cnoreabbrev "fz FzfLua"
vim.cmd.cnoreabbrev "pa FzfLua packadd"

-- Common typo
vim.cmd.cnoreabbrev "w; w"
