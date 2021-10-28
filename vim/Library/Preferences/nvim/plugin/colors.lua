vim.opt.termguicolors = true
-- vim.g.zenbones_compat = 1

vim.api.nvim_command [[ autocmd ColorScheme *bones,zenflesh,zenwritten lua require("mcchrish.feline").setup()]]

local function colorscheme(c)
	vim.api.nvim_command(string.format("colorscheme %s", c))
end

vim.g.zenbones = {
	-- lightness = "dim",
	-- dim_noncurrent_window = true,
	-- solid_vert_split = true,
	solid_line_nr = true,
	darken_non_text = 30,
	-- italic_comments = false,
}
colorscheme "zenbones"

-- vim.g.zenflesh = {
-- 	darkness = "warm",
-- 	lighten_noncurrent_window = true,
-- 	solid_vert_split = true,
-- 	lighten_non_text = 60,
-- }
-- colorscheme "zenflesh"

-- vim.opt.background = "light"

-- colorscheme "rosebones"
-- colorscheme "forestbones"
-- colorscheme "zenwritten"
-- colorscheme "nordbones"

-- vim.g.neobones = {
-- 	darken_noncurrent_window = true,
-- 	lighten_line_nr = true,
-- 	solid_float_border = true,
-- 	solid_vert_split = true,
-- }
-- colorscheme "neobones"

vim.g.tokyobones_darkness = "warm"
-- colorscheme "tokyobones"
-- colorscheme "tokyonight"
