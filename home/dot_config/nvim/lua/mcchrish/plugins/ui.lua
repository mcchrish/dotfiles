return {
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

	{ "j-hui/fidget.nvim", opts = {} },

	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		ft = { "codecompanion" },
		opts = {
			file_types = { "markdown", "codecompanion" },
			heading = {
				width = "block",
				left_pad = 2,
				right_pad = 2,
			},
			bullet = {
				icons = { "•", "◦", "◆", "◇" },
			},
			sign = { enabled = false },
			code = {
				width = "block",
			},
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
