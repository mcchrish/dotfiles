local wk = require "which-key"

wk.register({
	["<leader>"] = {
		["<cr>"] = {
			function()
				vim.cmd.nohlsearch()
				vim.cmd.checktime()
				vim.cmd.redraw()
				print "Refreshed!"
			end,
			"Refresh"
		},
		A = {
			function()
				require("fzf-lua").grep {
					search = "",
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --colors='path:fg:white' --hidden",
				}
			end,
			"FZF grep result (include hidden)",
		},
		a = {
			function()
				require("fzf-lua").grep { search = "" }
			end,
			"FZF grep result",
		},
		K = {
			function()
				require("fzf-lua").grep_cword()
			end,
			"FZF cword",
		},
		f = {
			function()
				require("fzf-lua").files()
			end,
			"FZF files",
		},
		d = {
			function()
				require("fzf-lua").files { cwd = vim.fn.expand "%:h" }
			end,
			"FZF files (active buffer dir)",
		},
		b = {
			function()
				require("fzf-lua").buffers()
			end,
			"FZF buffers",
		},
		l = {
			function()
				require("fzf-lua").blines()
			end,
			"FZF buffer lines",
		},
		L = {
			function()
				require("fzf-lua").lines()
			end,
			"FZF lines",
		},
		m = {
			function()
				require("fzf-lua").marks()
			end,
			"FZF marks",
		},
	},
	gQ = {
		function()
			require("fzf-lua").command_history()
		end,
		"FZF command history",
	},
}, { noremap = true, silent = true })

wk.register({
	["<leader>"] = {
		K = {
			function()
				require("fzf-lua").grep_visual()
			end,
			"FZF with current selection",
		},
	},
}, { mode = "v", noremap = true, silent = true })
