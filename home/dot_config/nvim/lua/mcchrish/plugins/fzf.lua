return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	opts = function()
		local actions = require "fzf-lua.actions"
		return {
			defaults = {
				git_icons = false,
				file_icons = false,
			},
			winopts = {
				width = 0.9,
				height = 0.6,
				row = 0.5,
				col = 0.5,
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				preview = {
					border = { " ", " ", " ", " ", " ", " ", " ", " " },
					horizontal = "right:50%",
				},
			},
			hls = {
				title = "FloatTitle",
				preview_border = "LineNr",
				preview_normal = "LineNr",
			},
			fzf_colors = true,
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
			previewers = {
				builtin = {
					scrollbar = false,
				},
			},
			files = {
				formatter = { "path.filename_first", 2 },
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			git = {
				files = {
					prompt = "Tracked files❫ ",
					formatter = { "path.filename_first", 2 },
				},
				status = {
					prompt = "Status❫ ",
				},
				commits = {
					prompt = "Commits❫ ",
				},
				bcommits = {
					prompt = "Bcommits❫ ",
				},
				branches = {
					prompt = "Branches❫ ",
				},
				tags = {
					prompt = "Tags❫ ",
				},
				stash = {
					prompt = "Stash❫ ",
				},
			},
			grep = {
				prompt = "Grep❫ ",
				input_prompt = "Grep for❫ ",
				formatter = { "path.filename_first", 2 },
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --colors='path:fg:white' --colors='path:style:intense' -e",
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			args = {
				prompt = "Args❫ ",
			},
			oldfiles = {
				prompt = "History❫ ",
			},
			buffers = {
				prompt = "Buffers❫ ",
			},
			tabs = {
				prompt = "Tabs❫ ",
			},
			lines = {
				prompt = "Lines❫ ",
			},
			blines = {
				previewer = false,
				prompt = "Blines❫ ",
			},
			keymaps = {
				prompt = "Keymaps❫ ",
			},
			quickfix_stack = {
				prompt = "Quickfix stack❫ ",
			},
			lsp = {
				prompt_postfix = "❫ ",
			},
			code_actions = {
				prompt = "Code actions❫ ",
			},
			finder = {
				prompt = "LSP finder❫ ",
			},
			diagnostics = {
				prompt = "Diagnostics❫ ",
			},
			marks = {
				prompt = "Marks❫ ",
			},
		}
	end,
	init = function()
		vim.cmd.cnoreabbrev "fz FzfLua"
	end,
	config = function(_, opts)
		require("fzf-lua").setup(opts)
	end,
	keys = {
		{
			"<c-x><c-k>",
			function()
				require("fzf-lua").complete_bline()
			end,
			mode = { "i" },
			silent = true,
			desc = "Complete bline",
			remap = true,
		},
		{
			"<c-x><c-f>",
			function()
				require("fzf-lua").complete_path()
			end,
			mode = { "i" },
			silent = true,
			desc = "Complete path",
			remap = true,
		},
		{
			"<c-x><c-l>",
			function()
				require("fzf-lua").complete_line()
			end,
			mode = { "i" },
			silent = true,
			desc = "Complete line",
			remap = true,
		},
	},
}
