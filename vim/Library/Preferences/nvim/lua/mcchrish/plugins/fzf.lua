return {
	"ibhagwan/fzf-lua",
	opts = {
		global_git_icons = false,
		global_file_icons = false,
		winopts = {
			width = 0.9,
			height = 0.6,
			row = 0.5,
			col = 0.5,
			-- border = "none",
			border = { " ", " ", " ", " ", " ", " ", " ", " " },
		},
		hls = {
			border = "LineNr",
			preview_border = "NormalFloat",
			preview_normal = "NormalFloat",
			preview_title = "Title",
		},
		fzf_colors = {
			["gutter"] = { "bg", "LineNr" },
			["bg"] = { "bg", "LineNr" },
			["bg+"] = { "bg", "NormalFloat" },
			["fg+"] = { "fg", "NormalFloat" },
			["border"] = { "fg", "Comment" },
			["header"] = { "fg", "Comment" },
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
		grep = {
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --colors='path:fg:white' --colors='path:style:intense'",
		},
		blines = {
			previewer = false,
		},
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		vim.cmd.cnoreabbrev "fz FzfLua"
	end,
}
