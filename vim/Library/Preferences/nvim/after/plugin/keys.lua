vim.keymap("n", "<leader><cr>", function()
	vim.cmd.nohlsearch()
	vim.cmd.checktime()
	vim.cmd.redraw()
	print "Refreshed!"
end, { desc = "Refresh" })
