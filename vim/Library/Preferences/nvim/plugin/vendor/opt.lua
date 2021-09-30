local g = vim.g

-- vim-matchup
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = {}

-- undotree
g.undotree_WindowLayout = 2
g.undotree_SetFocusWhenToggle = 1
g.undotree_SplitWidth = 40

-- sneak
g["sneak#label"] = 1
g["sneak#use_ic_scs"] = 1

g.vim_vue_plugin_config = {
	syntax = {
		template = { "html" },
		script = { "javascript" },
		style = { "css", "scss" },
	},
	full_syntax = {},
	initial_indent = {},
	attribute = 1,
	keyword = 0,
	foldexpr = 0,
	debug = 0,
}

require("commented").setup {
	keybindings = { n = "gc", v = "gc", nl = "gcc" }, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
	hooks = {
		before_comment = function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
				require("ts_context_commentstring.internal").update_commentstring()
			end
		end,
	},
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

g.indent_blankline_filetype = { "yaml", "toml", "python" }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true

require("which-key").setup {}

require("mcchrish.feline").setup()
