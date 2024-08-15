local wezterm = require "wezterm"
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "zenbones"
-- https://github.com/wez/wezterm/issues/3616 font looks too thin
config.font = wezterm.font { family = "Zenbones Mono", harfbuzz_features = { "TXTR", "cv07=10", "cv10=13", "VSAG=1" } }
config.font_size = 13
config.line_height = 1.04
config.initial_cols = 160
config.initial_rows = 40
-- config.front_end = "WebGpu"
-- config.automatically_reload_config = false
-- config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"
-- config.freetype_render_target = "HorizontalLcd"

config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection "Left",
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection "Right",
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection "Up",
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection "Down",
	},
}

config.unix_domains = {
	{
		name = "fo",
	},
}

wezterm.on("gui-startup", function()
	-- require("workspaces").setup()
end)

config.window_frame = {
	font = wezterm.font { family = "Iosevka Curly Slab", weight = "Bold" },
}

config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 0,
}

return config
