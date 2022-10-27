vim.o.termguicolors = true
local colors_name = "zenbones"
vim.o.background = "light"
-- vim.g[colors_name .. "_compat"] = 1

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = { "*bones", "zenburned", "zenwritten" },
	callback = function(params)
		require("mcchrish.statusline").setup(params.match)
	end,
})

vim.g[colors_name] = {
	-- darkness = "stark",
	-- lightness = "bright",
	-- dim_noncurrent_window = true,
	solid_vert_split = true,
	solid_line_nr = true,
	darken_non_text = 30,
	-- italic_comments = false,
	-- transparent_background = true,
	-- lighten_cursor_line = 20,
	-- darken_cursor_line = 20,
	-- colorize_diagnostic_underline_text = true,
}

vim.cmd.colorscheme(colors_name)
