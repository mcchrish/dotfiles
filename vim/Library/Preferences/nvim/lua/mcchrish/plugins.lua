return {
	{ "rktjmp/shipwright.nvim", lazy = true },
	"nvim-lualine/lualine.nvim",
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
	"ggandor/leap.nvim",
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
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		init = function()
			local g = vim.g
			g.indent_blankline_filetype = { "yaml", "toml", "python" }
			g.indent_blankline_show_first_indent_level = false
			g.indent_blankline_use_treesitter = true
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
				auto_trigger = true,
				keymap = {
					accept = "<m-l>",
					accept_word = false,
					accept_line = false,
					next = "<m-]>",
					prev = "<m-[>",
					dismiss = "<c-]>",
				},
			},
			panel = { enabled = false },
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},

	-- "mcchrish/fountain.vim",
}
