return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
				opts = {},
			},
		},
		opts = {},
		config = function(_, opts)
			local ts = require "nvim-treesitter"
			ts.setup(opts)
			require("treesitter-context").setup()

			local parsers = {
				"css",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"luadoc",
				"lua",
				"toml",
				"tsx",
				"typescript",
				"vue",
				"yaml",
			}
			ts.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
