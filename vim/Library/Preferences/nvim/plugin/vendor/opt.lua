local g = vim.g

-- vim-matchup
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = {}

-- undotree
g.undotree_WindowLayout = 2
g.undotree_SetFocusWhenToggle = 1
g.undotree_SplitWidth = 40

require("Comment").setup {
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

require("gitsigns").setup {
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "━" },
		topdelete = { text = "━" },
		changedelete = { text = "┳" },
	},
}

require("gitlinker").setup()

g.indent_blankline_filetype = { "yaml", "toml", "python" }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true

require("which-key").setup {}

require("nvim-surround").setup {
	keymaps = {
		normal = "sa",
		normal_cur = "saa",
		visual = "s",
		delete = "sd",
		change = "sr",
	},
}

require("luasnip.loaders.from_vscode").lazy_load()
