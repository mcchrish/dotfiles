local wk = require "which-key"

wk.register {
	["<leader>"] = {
		["<cr>"] = {
			function()
				vim.cmd.nohlsearch()
				vim.cmd.checktime()
				vim.cmd.redraw()
				print "Refreshed!"
			end,
			"Refresh",
		},
	},
}
