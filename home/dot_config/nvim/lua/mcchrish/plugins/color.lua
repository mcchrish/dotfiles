return {
	{ "rktjmp/shipwright.nvim", lazy = true },
	{
		dir = "~/vimming/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		init = function()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = { "*bones", "zenburned", "zenwritten" },
				callback = function(params)
					require("mcchrish.statusline").setup(params.match)
				end,
			})
		end,
		config = function()
			local colors_name = "zenbones"
			-- vim.g[colors_name .. "_compat"] = 1
			vim.g[colors_name] = {
				-- darkness = "stark",
				-- lightness = "bright",
				-- dim_noncurrent_window = true,
				-- solid_vert_split = true,
				solid_line_nr = true,
				-- darken_non_text = 30,
				-- italic_comments = false,
				-- transparent_background = true,
				-- lighten_cursor_line = 20,
				-- darken_cursor_line = 20,
				-- colorize_diagnostic_underline_text = true,
			}
			vim.cmd.colorscheme(colors_name)
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			-- vim.cmd "colorscheme rose-pine"
		end,
	},
}
