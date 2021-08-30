local g = vim.g

-- vim-matchup
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = {}

-- context.vim
g.context_highlight_border = "SpecialComment"

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
		style = { "css" },
	},
	full_syntax = "",
	initial_indent = "",
	attribute = 0,
	keyword = 0,
	foldexpr = 0,
	debug = 0,
}

g.coq_settings = {
	auto_start = false,
	-- conflicts with window nav keys. Disable for now
	keymap = {
		jump_to_mark = "",
		bigger_preview = "",
	},
	clients = {
		tree_sitter = {
			enabled = false,
		},
		tags = {
			enabled = false,
		},
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

require("nnn").setup {
	command = "nnn -oCQ",
	set_default_mappings = 0,
	replace_netrw = 1,
	action = {
		["<c-t>"] = "tab split",
		["<c-s>"] = "split",
		["<c-v>"] = "vsplit",
		["<c-o>"] = function(lines)
			local joined_lines = table.concat(lines, "\n")
			vim.fn.setreg("+", joined_lines)
		end,
	},
}

require("trouble").setup {}

require("nvim_comment").setup {
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end,
}

require("indent_blankline").setup {
	filetype = { "lua", "vue", "javascript", "typescript", "yaml", "toml", "python" },
	show_first_indent_level = false,
	use_treesitter = true,
}
