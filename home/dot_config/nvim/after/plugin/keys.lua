vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd.nohlsearch()
	vim.cmd.checktime()
	vim.cmd.redraw()
	vim.notify("Refreshed!", vim.log.INFO)
end, { desc = "Refresh" })

vim.keymap.set("n", "<leader>u", function()
	require("undotree").open {
		command = "leftabove 40vnew",
	}
end)
