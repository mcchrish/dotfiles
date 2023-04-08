return {
	{
		"nvim-treesitter/nvim-treesitter",
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
				"help",
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
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
