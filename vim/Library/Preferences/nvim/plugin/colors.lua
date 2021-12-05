vim.opt.termguicolors = true
local colors_name = "zenbones"
vim.opt.background = "light"
-- vim.g[colors_name .. "_compat"] = 1

vim.api.nvim_command [[autocmd ColorScheme everforest,tokyonight,*bones,zenburned,zenwritten lua require("mcchrish.statusline").setup(vim.fn.expand "<amatch>")]]

vim.g[colors_name] = {
	darkness = "stark",
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

vim.api.nvim_command("colorscheme " .. colors_name)
