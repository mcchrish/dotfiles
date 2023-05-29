local wezterm = require "wezterm"
local act = wezterm.action

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "zenbones"
config.font = wezterm.font "Iosevka Curly Slab"
config.font_size = 14
config.initial_cols = 160
config.initial_rows = 40

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

return config
