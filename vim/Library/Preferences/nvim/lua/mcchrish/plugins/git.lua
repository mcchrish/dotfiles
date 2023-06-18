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
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		keys = {
			{ "<leader>gy", mode = { "n", "x" } },
		},
		config = function()
			require("gitlinker").setup()
		end,
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
