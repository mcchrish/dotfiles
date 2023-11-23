return {
	{ "rktjmp/shipwright.nvim", lazy = true },
	"nvim-lualine/lualine.nvim",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = false,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup {}
		end,
	},
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
	"tpope/vim-eunuch",
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
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
			require("ts_context_commentstring").setup {
				enable_autocmd = false,
			}
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			enabled = false,
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
		config = function(_, opts)
			require("nvim-surround").setup(opts)
		end,
	},

	{
		"zbirenbaum/copilot.lua",
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
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {},
		config = function(_, opts)
			require("fidget").setup(opts)
		end,
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
		"stevearc/aerial.nvim",
		opts = {},
	},

	-- "mcchrish/fountain.vim",
}
