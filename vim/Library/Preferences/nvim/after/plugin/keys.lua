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

-- wk.register({
-- 	["j"] = { "v:count == 0 ? 'gj' : 'j'" },
-- 	["k"] = { "v:count == 0 ? 'gk' : 'k'" },
-- }, { mode = { "n", "x" }, expr = true, silent = true, noremap = false })
