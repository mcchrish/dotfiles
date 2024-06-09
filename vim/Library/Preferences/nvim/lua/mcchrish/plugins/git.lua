return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{
				"<leader>gs",
				mode = "n",
				"<cmd>G<cr>",
				desc = "Fugitive",
			},
			{
				"<leader>gd",
				mode = "n",
				"<cmd>Gdiffsplit<cr>",
				desc = "Fugitive diffsplit",
			},
			{
				"<leader>gb",
				mode = "n",
				"<cmd>G blame<cr>",
				desc = "Fugitive blame",
			},
		},
	},
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
	},
	{ "sindrets/diffview.nvim", event = "VeryLazy" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>gg",
				mode = "n",
				"<cmd>Gitsigns toggle_signs<cr>",
				desc = "Git signs toggle",
			},
			{
				"<leader>gh",
				mode = "n",
				"<cmd>Gitsigns toggle_linehl<cr>",
				desc = "Git signs toggle highlight",
			},
		},
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "━" },
				topdelete = { text = "━" },
				changedelete = { text = "┳" },
			},
			on_attach = function(bufnr)
				local gitsigns = require "gitsigns"

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal { "]c", bang = true }
					else
						gitsigns.nav_hunk "next"
					end
				end, { desc = "Jump to next git [c]hange" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal { "[c", bang = true }
					else
						gitsigns.nav_hunk "prev"
					end
				end, { desc = "Jump to previous git [c]hange" })

				-- Actions
				-- visual mode
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
				end, { desc = "stage git hunk" })
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
				end, { desc = "reset git hunk" })
				-- normal mode
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
				map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
				map("n", "<leader>hD", function()
					gitsigns.diffthis "@"
				end, { desc = "git [D]iff against last commit" })
				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
				map("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })
			end,
		},
	},
	{
		"linrongbin16/gitlinker.nvim",
		keys = {
			{ "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "x" }, desc = "Copy git permlink to clipboard" },
			{ "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", "x" }, desc = "Open git permlink in browser" },
		},
		config = function()
			require("gitlinker").setup()
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{
				"<leader>u",
				mode = "n",
				"<cmd>UndotreeToggle<cr>",
				desc = "Undotree toggle",
			},
		},
		init = function()
			local g = vim.g
			g.undotree_WindowLayout = 2
			g.undotree_SetFocusWhenToggle = 1
			g.undotree_SplitWidth = 40
		end,
	},
}
