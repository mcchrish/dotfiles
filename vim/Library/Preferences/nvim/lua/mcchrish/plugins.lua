return {
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		init = function()
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_offscreen = {}
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			search = {
				multi_window = false,
			},
			highlight = {
				backdrop = false,
			},
			modes = {
				char = {
					highlight = { backdrop = true },
				},
			},
		},
		keys = {
			{
				"sf",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"st",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"sw",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"sT",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"tpope/vim-sleuth",
		init = function()
			-- https://github.com/tpope/vim-sleuth/issues/83
			vim.g.editorconfig = false
		end,
	},
	"tpope/vim-rsi",

	{ "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim", opts = {} },
	{ "chrisgrieser/nvim-chainsaw", opts = {} },
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		keys = {
			{
				"<leader>%",
				function()
					require("rip-substitute").sub()
				end,
				mode = { "n", "x" },
				desc = " Rip substitute",
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		cmd = { "IBLToggle", "IBLToggleScope" },
		opts = {
			-- enabled = false,
			indent = {
				char = "│",
				tab_char = "│",
			},
		},
		config = function(_, opts)
			require("ibl").setup(opts)
			local hooks = require "ibl.hooks"
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		end,
	},

	{ "echasnovski/mini.bracketed", opts = {} },
	{ "echasnovski/mini.ai", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{
		"echasnovski/mini.align",
		opts = {},
		keys = {
			{ "ga", mode = { "n", "v" } },
			{ "gA", mode = { "n", "v" } },
		},
	},
	{
		"echasnovski/mini.basics",
		opts = {
			options = {
				basic = false,
			},
			autocommands = {
				basic = false,
			},
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = {
					enable_autocmd = false,
				},
			},
		},
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = false,
				hide_during_completion = false,
				keymap = {
					accept = "<m-l>",
					accept_word = false,
					accept_line = false,
					next = "<m-]>",
					prev = "<m-[>",
					dismiss = "<m-L>",
				},
			},
			panel = { enabled = false },
		},
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>p",
				function()
					require("conform").format { async = true, lsp_fallback = true }
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				markdown = { "prettier" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = "BufReadPre",
		opts = {
			linters_by_ft = {
				lua = { "selene" },
			},
		},
		config = function(_, opts)
			require("lint").linters_by_ft = opts.linters_by_ft
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		keys = {
			{
				"-",
				function()
					require("oil").open_float()
				end,
				desc = "Browse dir",
			},
			{
				"_",
				function()
					require("oil").open_float(vim.uv.cwd())
				end,
				desc = "Browse dir (cwd)",
			},
		},
		opts = {
			float = {
				max_width = 120,
				height = 0.7,
			},
			keymaps = {
				["gq"] = "actions.close",
				["g?"] = "actions.show_help",
				["<cr>"] = "actions.select",
				["<c-s>"] = "actions.select_split",
				["<c-v>"] = "actions.select_vsplit",
				["<c-t>"] = "actions.select_tab",
				["<c-p>"] = "actions.preview",
				["<c-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		},
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			ui = {
				-- enable = false,
			},
			workspaces = {
				{
					name = "Stuff",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Stuff",
				},
			},
		},
	},

	{ "rcarriga/nvim-notify" },

	{
		"dmmulroy/tsc.nvim",
		cmd = { "TSC" },
		opts = {
			use_trouble_qflist = true,
		},
	},

	{ "brenoprata10/nvim-highlight-colors", opts = {} },

	{ "echasnovski/mini.icons", lazy = true, opts = {} },
	-- "mcchrish/fountain.vim",
}
