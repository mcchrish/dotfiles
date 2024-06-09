return {
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{
		"echasnovski/mini.clue",
		opts = function()
			local miniclue = require "mini.clue"
			return {
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<leader>" },
					{ mode = "x", keys = "<leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<c-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<c-r>" },
					{ mode = "c", keys = "<c-r>" },

					-- Window commands
					{ mode = "n", keys = "<c-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},
				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
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
	{ "stevearc/dressing.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
}
