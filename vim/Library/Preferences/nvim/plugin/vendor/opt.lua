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

-- coq
-- conflicts with window nav keys. Disable for now
g.coq_settings = {
	auto_start = false,
	keymap = {
		jump_to_mark = "",
		bigger_preview = "",
	},
}

-- require("lualine").setup {
-- 	options = {
-- 		theme = "zenbones",
-- 	},
-- }
