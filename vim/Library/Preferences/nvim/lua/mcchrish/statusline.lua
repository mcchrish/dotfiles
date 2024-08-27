local M = {}

M.setup = function(colors_name)
	require("lualine").setup {
		options = {
			globalstatus = true,
			theme = colors_name,
			section_separators = "",
			component_separators = "",
			disabled_filetypes = {
				winbar = { "Avante", "AvanteInput" },
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					padding = 0,
					fmt = function()
						return " "
					end,
				},
			},
			lualine_b = {},
			lualine_c = {
				{
					"diagnostics",
					symbols = { error = "▬", warn = "▪", hint = "▪", info = "⋅" },
				},
			},
			lualine_x = {
				{
					"filetype",
					colored = false,
					icon_only = true,
				},
			},
			lualine_y = { { "branch" } },
			lualine_z = {
				{ "location", separator = "|", padding = { left = 1 } },
				{ "progress", padding = { right = 1 } },
			},
		},
		inactive_sections = {
			lualine_a = { { "filename", path = 1, padding = { left = 2 }, color = "StatusLineNC" } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{ "location", separator = "|", padding = 1, color = "StatusLineNC" },
				{ "progress", padding = { right = 1 }, color = "StatusLineNC" },
			},
		},

		winbar = {
			lualine_a = {
				{
					"mode",
					padding = 0,
					fmt = function()
						return " "
					end,
				},
			},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1, padding = { left = 2 } } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	}
end

return M
