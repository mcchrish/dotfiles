-- :h lua-highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Common typo
vim.cmd.cnoreabbrev "w; w"
