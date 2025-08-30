return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			playground = {
				enable = false,
			},
			ensure_installed = {
				"css",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"luadoc",
				"luap",
				"toml",
				"tsx",
				"typescript",
				"vue",
				"yaml",
			},
			matchup = {
				enable = true,
			},
			highlight = {
				enable = true,
				disable = { "yaml" },
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
