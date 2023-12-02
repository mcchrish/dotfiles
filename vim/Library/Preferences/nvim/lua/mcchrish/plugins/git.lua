return {
	"tpope/vim-fugitive",
	"junegunn/gv.vim",
	"sindrets/diffview.nvim",
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
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
		init = function()
			local g = vim.g
			g.undotree_WindowLayout = 2
			g.undotree_SetFocusWhenToggle = 1
			g.undotree_SplitWidth = 40
		end,
	},
}
