require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"css",
		"graphql",
		"html",
		"lua",
		"javascript",
		"php",
		"typescript",
		"vue",
	},
	matchup = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "vue" }
	},
	indent = {
		enable = true,
	},
}
