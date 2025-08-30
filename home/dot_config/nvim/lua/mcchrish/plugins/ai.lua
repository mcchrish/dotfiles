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
		"olimorris/codecompanion.nvim",
		-- lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				http = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = vim.env.ANTHROPIC_API_KEY,
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
					slash_commands = {
						buffer = {
							opts = {
								provider = "fzf_lua",
							},
						},
						file = {
							opts = {
								provider = "fzf_lua",
							},
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
				agent = {
					adapter = "copilot",
				},
			},
		},
	},
}
