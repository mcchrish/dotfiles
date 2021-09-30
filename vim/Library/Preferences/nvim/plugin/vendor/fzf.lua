require("fzf-lua").setup {
	winopts = {
		win_width = 0.9,
		win_height = 0.6,
		win_row = 0.50,
		win_col = 0.50,
	},
	fzf_binds = {
		["alt-a"] = "toggle-all",
		["down"] = "half-page-down",
		["up"] = "half-page-up",
		["shift-down"] = "preview-page-down",
		["shift-up"] = "preview-page-up",
	},
	fzf_opts = {
		["--prompt"] = " ❫",
		["--info"] = "default",
		["--layout"] = "default",
	},
	preview_horizontal = "right:50%",
	previewers = {
		builtin = {
			scrollbar = false,
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
