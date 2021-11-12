local M = {}

M.setup = function(colors_name)
	require("lualine").setup {
		options = {
			theme = colors_name,
			section_separators = "",
			component_separators = "",
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icons_enabled = false,
					padding = 0,
					fmt = function()
						return " "
					end,
				},
			},
			lualine_b = { { "filename", path = 1, color = "StatusLine" } },
			lualine_c = { { "diagnostics", symbols = { error = "▬", warn = "▪", hint = "▪", info = "⋅" } } },
			lualine_x = { { "filetype" } },
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
	}
end

return M
