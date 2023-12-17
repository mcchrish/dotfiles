return {
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy" },
	{ "stevearc/dressing.nvim", opts = {} },
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		init = function()
			local g = vim.g
			g.matchup_matchparen_deferred = 1
			g.matchup_matchparen_offscreen = {}
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
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	{
		"tpope/vim-sleuth",
		init = function()
			-- https://github.com/tpope/vim-sleuth/issues/83
			vim.g.editorconfig = false
		end,
	},
	"tpope/vim-rsi",

	{ "chrisgrieser/nvim-genghis", dependencies = "stevearc/dressing.nvim" },

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

	{
		"kylechui/nvim-surround",
		opts = {
			keymaps = {
				normal = "sa",
				normal_cur = "saa",
				visual = "s",
				delete = "sd",
				change = "sr",
			},
		},
	},

	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				keymap = false,
			},
			panel = { enabled = false },
		},
		keys = {
			{
				"<c-l>",
				mode = { "i" },
				function()
					require("copilot.suggestion").accept()
				end,
				desc = "Copilot accept",
			},
			{
				"<c-s>",
				mode = { "i" },
				function()
					require("cmp").close()
					require("copilot.suggestion").next()
				end,
				desc = "Copilot next",
			},
			{
				"<c-S>",
				mode = { "i" },
				function()
					require("cmp").close()
					require("copilot.suggestion").prev()
				end,
				desc = "Copilot prev",
			},
			{
				"<c-L>",
				mode = { "i" },
				function()
					require("copilot.suggestion").dismiss()
				end,
				desc = "Copilot accept",
			},
		},
	},

	{ "j-hui/fidget.nvim", opts = {} },

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

	{ "stevearc/aerial.nvim", event = "VeryLazy", opts = {} },

	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>nn",
				"<cmd>Oil --float<cr>",
				mode = { "n" },
				desc = "Open file browser",
			},
			{
				"<leader>nc",
				"<cmd>Oil --float %:h<cr>",
				mode = { "n" },
				desc = "Open file browser under current file",
			},
		},
		opts = {
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
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},

	{ "echasnovski/mini.pairs", event = "VeryLazy", opts = {} },

	-- "mcchrish/fountain.vim",
}
