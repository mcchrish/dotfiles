return {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			win_width = 0.9,
			win_height = 0.6,
			win_row = 0.5,
			win_col = 0.5,
			hl_border = "FloatBorder",
		},
		keymap = {
			fzf = {
				["alt-a"] = "toggle-all",
				["down"] = "half-page-down",
				["up"] = "half-page-up",
				["f2"] = "toggle-preview",
				["f3"] = "toggle-preview-wrap",
				["shift-down"] = "preview-page-down",
				["shift-up"] = "preview-page-up",
			},
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
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		vim.cmd.cnoreabbrev "fz FzfLua"
		vim.cmd.cnoreabbrev "pa FzfLua packadd"
	end,
}
