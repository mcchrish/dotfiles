return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	opts = function()
		local actions = require "fzf-lua.actions"
		return {
			global_git_icons = false,
			global_file_icons = false,
			winopts = {
				width = 0.9,
				height = 0.6,
				row = 0.5,
				col = 0.5,
				-- border = "none",
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				preview = {
					horizontal = "right:50%",
				},
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
			"<leader><space>",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>,",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep (root dir)",
		},
		{
			"<leader>:",
			function()
				require("fzf-lua").commands()
			end,
			desc = "Command",
		},
		{
			"<leader>s:",
			function()
				require("fzf-lua").command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Builtin commands",
		},
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files (root dir)",
		},
		{
			"<leader>sF",
			function()
				require("fzf-lua").files { cwd = vim.uv.cwd() }
			end,
			desc = "Files (cwd)",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").git_files()
			end,
			desc = "Files (git)",
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Recent files",
		},
		{
			"<leader>sH",
			function()
				require("fzf-lua").oldfiles { cwd = vim.uv.cwd() }
			end,
			desc = "Recent files (cwd)",
		},
		{
			"<leader>sw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Grep cword",
		},
		{
			"<leader>sW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "Grep cWORD",
		},
		{
			"<leader>ss",
			function()
				require("fzf-lua").grep_visual()
			end,
			mode = "v",
			desc = "Grep selection",
		},
		{
			"<leader>s%",
			function()
				require("fzf-lua").lgrep_curbuf {
					prompt = "Buffer❫ ",
				}
			end,
			desc = "Grep buffer",
		},
		{
			"<leader>s*",
			function()
				require("fzf-lua").grep_curbuf {
					prompt = "Buffer❫ ",
					search = vim.fn.expand "<cword>",
				}
			end,
			desc = "Grep buffer with cword",
		},
		{
			"<leader>sl",
			function()
				require("fzf-lua").blines()
			end,
			desc = "Buffer lines",
		},
		{
			"<leader>sL",
			function()
				require("fzf-lua").lines()
			end,
			desc = "Lines",
		},
		{
			"<leader>sm",
			function()
				require("fzf-lua").marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "Help",
		},
		{
			"<leader>sH",
			function()
				require("fzf-lua").man_pages()
			end,
			desc = "Man pages",
		},
		{
			"<leader>sj",
			function()
				require("fzf-lua").jumps()
			end,
			desc = "Jumplist",
		},
		{
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sq",
			function()
				require("fzf-lua").quickfix()
			end,
			desc = "Quickfix",
		},
		{
			"<leader>sQ",
			function()
				require("fzf-lua").loclist()
			end,
			desc = "Location list",
		},
		{
			[[<leader>s"]],
			function()
				require("fzf-lua").registers()
			end,
			desc = "Registers",
		},

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
