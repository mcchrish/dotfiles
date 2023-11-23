return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		opts = {
			playground = {
				enable = false,
			},
			ensure_installed = {
				"bash",
				"css",
				"graphql",
				"html",
				"javascript",
				"lua",
				"markdown",
				"query",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
			},
			matchup = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			require("treesitter-context").setup()
		end,
	},
}
