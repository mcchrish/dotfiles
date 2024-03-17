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
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Navigation
				map({ "n", "v" }, "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Jump to next git [c]hange" })
				map({ "n", "v" }, "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Jump to previous git [c]hange" })
				-- Actions
				-- visual mode
				map("v", "<leader>hs", function()
					gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
				end, { desc = "Stage git hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
				end, { desc = "Reset git hunk" })
				-- normal mode
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Git [s]tage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Git [r]eset hunk" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "Git [S]tage buffer" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git [u]ndo stage hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Git [R]eset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Git [p]review hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line { full = false }
				end, { desc = "git [b]lame line" })
				map("n", "<leader>hd", gs.diffthis, { desc = "Git [d]iff against index" })
				map("n", "<leader>hD", function()
					gs.diffthis "@"
				end, { desc = "Git [D]iff against last commit" })
				-- Toggles
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "[T]oggle git show [d]eleted" })
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
