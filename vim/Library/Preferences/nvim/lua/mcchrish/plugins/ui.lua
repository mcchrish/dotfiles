return {
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			icons = {
				rules = false,
			},
		},
		keys = {
			{
				"<leader>@",
				function()
					require("which-key").show { global = false }
				end,
				desc = "Buffer local keymaps (which-key)",
			},
		},
	},
	{ "stevearc/dressing.nvim", opts = {} },
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				override_vim_notify = true,
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		enabled = false,
		opts = {
			filetypes = { "markdown", "Avante", "codecompanion" },
			hybrid_modes = { "n" },
		},
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		opts = {},
	},
	{
		"tris203/precognition.nvim",
		cmd = "Precognition",
		keys = {
			{
				"<leader>!",
				function()
					require("precognition").toggle()
				end,
				desc = "Buffers",
			},
		},
		opts = {},
	},

	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
	},
}
