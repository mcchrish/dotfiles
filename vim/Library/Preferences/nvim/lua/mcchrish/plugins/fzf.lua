return {
	"ibhagwan/fzf-lua",
	keys = {
		{
			"<leader>a",
			function()
				require("fzf-lua").grep { search = "" }
			end,
			mode = { "n" },
			desc = "FZF grep result",
		},
		{
			"<leader>A",
			function()
				require("fzf-lua").grep {
					search = "",
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --colors='path:fg:white' --hidden",
				}
			end,
			mode = { "n" },
			desc = "FZF grep result (include hidden)",
		},
		{
			"<leader>K",
			function()
				require("fzf-lua").grep_cword()
			end,
			mode = { "n" },
			desc = "FZF cword",
		},
		{
			"<leader>K",
			function()
				require("fzf-lua").grep_visual()
			end,
			mode = { "v" },
			desc = "FZF with current selection",
		},
		{
			"<leader>f",
			function()
				require("fzf-lua").files()
			end,
			mode = { "n" },
			desc = "FZF files",
		},
		{
			"<leader>d",
			function()
				require("fzf-lua").files { cwd = vim.fn.expand "%:h" }
			end,
			mode = { "n" },
			desc = "FZF files (active buffer dir)",
		},
		{
			"<leader>b",
			function()
				require("fzf-lua").buffers()
			end,
			mode = { "n" },
			desc = "FZF buffers",
		},
		{
			"<leader>l",
			function()
				require("fzf-lua").blines()
			end,
			mode = { "n" },
			desc = "FZF buffer lines",
		},
		{
			"<leader>L",
			function()
				require("fzf-lua").lines()
			end,
			mode = { "n" },
			desc = "FZF lines",
		},
		{
			"<leader>m",
			function()
				require("fzf-lua").marks()
			end,
			mode = { "n" },
			desc = "FZF marks",
		},
		{
			"gQ",
			function()
				require("fzf-lua").command_history()
			end,
			mode = { "n" },
			desc = "FZF command history",
		},
		{
			"<c-x><c-k>",
			function()
				require("fzf-lua").complete_bline()
			end,
			mode = { "i" },
			silent = true,
			desc = "FZF complete bline",
			remap = true,
		},
		{
			"<c-x><c-f>",
			function()
				require("fzf-lua").complete_path()
			end,
			mode = { "i" },
			silent = true,
			desc = "FZF complete path",
			remap = true,
		},
		{
			"<c-x><c-l>",
			function()
				require("fzf-lua").complete_line()
			end,
			mode = { "i" },
			silent = true,
			desc = "FZF complete line",
			remap = true,
		},
	},
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
