return {
	{ dir = "~/vimming/zenbones.nvim", dependencies = "rktjmp/lush.nvim", lazy = true },
	{ "rktjmp/shipwright.nvim", lazy = true },
	"nvim-lualine/lualine.nvim",
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	},
	{ "junegunn/vim-easy-align", lazy = true },
	{
		"andymass/vim-matchup",
		init = function()
			local g = vim.g
			g.matchup_matchparen_deferred = 1
			g.matchup_matchparen_offscreen = {}
		end,
	},
	"ggandor/leap.nvim",
	"tpope/vim-eunuch",
	"tpope/vim-unimpaired",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-rsi",
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
		"numToStr/Comment.nvim",
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
		"mattn/emmet-vim",
		cmd = "EmmetInstall",
		init = function()
			vim.g.user_emmet_mode = "i"
			vim.g.user_emmet_leader_key = "<c-s>"
			vim.g.user_emmet_install_global = 0

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"html",
					"css",
					"sass",
					"scss",
					"javascript",
					"vue",
					"typescriptreact",
					"markdown",
				},
				command = "EmmetInstall",
			})
		end,
	},
	-- "mcchrish/fountain.vim",
}
