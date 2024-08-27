return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				-- auto_trigger = true,
				-- hide_during_completion = false,
				keymap = {
					accept = "<m-y>",
					accept_word = false,
					accept_line = false,
					next = "<m-]>",
					prev = "<m-[>",
					dismiss = "<m-Y>",
				},
			},
			panel = { enabled = false },
		},
	},

	{
		"yetone/avante.nvim",
		enabled = false,
		event = "VeryLazy",
		build = "make",
		opts = {
			-- provider = "claude",
			provider = "copilot",
		},
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"olimorris/codecompanion.nvim",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				anthropic = function()
					return require("codecompanion.adapters").use("anthropic", {
						env = {
							api_key = vim.env.ANTHROPIC_API_KEY,
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
				agent = {
					adapter = "anthropic",
				},
			},
		},
	},

	{
		"magicalne/nvim.ai",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			provider = "anthropic",
		},
	},
}
