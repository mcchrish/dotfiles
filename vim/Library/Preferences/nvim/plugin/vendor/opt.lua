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

g.coq_settings = {
	-- conflicts with window nav keys. Disable for now
	keymap = {
		jump_to_mark = "",
		bigger_preview = "",
		recommended = false,
	},
	clients = {
		tags = {
			enabled = false,
		},
	},
	display = {
		ghost_text = {
			enabled = false,
		},
		pum = {
			fast_close = false,
		},
		icons = {
			mode = "none",
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
		["<c-w>"] = function(lines)
			local dir = lines[#lines]
			if vim.fn.filereadable(dir) then
				dir = vim.fn.fnamemodify(dir, ":h")
			end
			vim.api.nvim_command("cd " .. dir)
		end,
	},
}

require("nvim_comment").setup {
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end,
}

g.indent_blankline_filetype = { "yaml", "toml", "python" }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true

require("fzf-lua").setup {
	winopts = {
		win_width = 0.9,
		win_height = 0.6,
		win_row = 0.50,
		win_col = 0.50,
	},
	fzf_layout = "default",
	fzf_info = "--info=default",
	fzf_binds = {
		"alt-a:select-all",
		"alt-d:deselect-all",
		"down:half-page-down",
		"up:half-page-up",
		"shift-down:preview-page-down",
		"shift-up:preview-page-up",
	},
	preview_horizontal = "right:50%",
	previewers = {
		builtin = {
			syntax = false,
		},
	},
	files = {
		file_icons = false,
		git_icons = false,
	},
	git = {
		files = {
			file_icons = false,
		},
		status = {
			file_icons = false,
		},
	},
	grep = {
		file_icons = false,
		git_icons = false,
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --colors='path:fg:white' --colors='path:style:intense'",
	},
	buffers = {
		file_icons = false,
		git_icons = false,
	},
	blines = {
		previewer = false,
	},
	quickfix = {
		file_icons = false,
		git_icons = false,
	},
	lsp = {
		file_icons = false,
		git_icons = false,
	},
}

require("which-key").setup {}

-- require("mcchrish.feline").setup()
