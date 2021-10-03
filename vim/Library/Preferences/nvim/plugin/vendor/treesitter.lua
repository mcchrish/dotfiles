require("nvim-treesitter.configs").setup {
	playground = {
		enable = false,
	},
	ensure_installed = {
		"css",
		"graphql",
		"html",
		"javascript",
		"lua",
		"php",
		"ruby",
		"tsx",
		"typescript",
		"vue",
	},
	matchup = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "vue" },
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
}
