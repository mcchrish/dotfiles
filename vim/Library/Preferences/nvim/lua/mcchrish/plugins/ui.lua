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
}
