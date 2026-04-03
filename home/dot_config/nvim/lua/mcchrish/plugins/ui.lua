return {
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{
		"nvim-mini/mini.clue",
		config = function()
			local miniclue = require "mini.clue"
			miniclue.setup {
				triggers = {
					-- Leader triggers
					{ mode = { "n", "x" }, keys = "<Leader>" },

					-- `[` and `]` keys
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = { "n", "x" }, keys = "g" },

					-- Marks
					{ mode = { "n", "x" }, keys = "'" },
					{ mode = { "n", "x" }, keys = "`" },

					-- Registers
					{ mode = { "n", "x" }, keys = '"' },
					{ mode = { "i", "c" }, keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = { "n", "x" }, keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.square_brackets(),
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}
		end,
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
		"nvim-mini/mini.icons",
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
