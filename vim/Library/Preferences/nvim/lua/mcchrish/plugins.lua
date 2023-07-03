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

	-- "mcchrish/fountain.vim",
}
