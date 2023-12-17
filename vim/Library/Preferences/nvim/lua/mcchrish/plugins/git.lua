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
		},
	},
	{
		"linrongbin16/gitlinker.nvim",
		keys = {
			{ "<leader>gl", "<cmd>GitLink<cr>", mode = { "n", "x" }, desc = "Copy git permlink to clipboard" },
			{ "<leader>gL", "<cmd>GitLink!<cr>", mode = { "n", "x" }, desc = "Open git permlink in browser" },
		},
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
