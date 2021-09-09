local t = require "zenbones"
local c = require "zenbones.colors"

local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

local properties = {
	force_inactive = {
		filetypes = {},
		buftypes = {},
		bufnames = {},
	},
}

local components = {
	active = {},
	inactive = {},
}

-- left
components.active[1] = {
	{
		provider = " ",
		hl = function()
			return {
				name = vi_mode_utils.get_mode_highlight_name(),
				bg = vi_mode_utils.get_mode_color(),
				style = "bold",
			}
		end,
		icon = "",
	},
	{
		provider = "file_info",
		type = "relative",
		file_modified_icon = "●",
		file_readonly_icon = " ",
		icon = "",
	},
	{
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist "Error"
		end,
		hl = { fg = t.LspDiagnosticsDefaultError.fg.hex },
		icon = " ▬",
	},
	{
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist "Warning"
		end,
		hl = { fg = t.LspDiagnosticsDefaultWarning.fg.hex },
		icon = " ▪",
	},
	{
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist "Hint"
		end,
		hl = { fg = t.LspDiagnosticsDefaultHint.fg.hex },
		icon = " ▪",
	},
	{
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist "Information"
		end,
		hl = { fg = t.LspDiagnosticsDefaultInformation.fg.hex },
		icon = " ⋅",
	},
}

-- right
components.active[2] = {
	{
		provider = function ()
			return vim.bo.filetype
		end,
		hl = {
			fg = t.Type.fg.hex,
		},
		right_sep = " "
	},
	{
		provider = "git_branch",
		hl = {
			fg = t.Folded.fg.hex,
			bg = t.PmenuSbar.bg.hex,
		},
		left_sep = {
			str = " ",
			hl = { bg = t.PmenuSbar.bg.hex },
		},
		right_sep = {
			str = " ",
			hl = { bg = t.PmenuSbar.bg.hex },
		},
		icon = " ",
	},
	{
		provider = "position",
		left_sep = " ",
		right_sep = {
			str = "|",
			hl = {
				fg = t.Folded.fg.hex,
				bg = "bg",
			},
		},
	},
	{
		provider = "line_percentage",
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
}

local inactive_hl = {
	fg = t.StatusLineNC.fg.hex,
	bg = t.StatusLineNC.bg.hex,
}

components.inactive[1] = {
	{
		provider = " ",
		hl = inactive_hl,
		icon = "",
	},
	{
		provider = "file_info",
		type = "relative",
		file_modified_icon = "● ",
		file_readonly_icon = " ",
		hl = inactive_hl,
		icon = "",
	},
}

components.inactive[2] = {
	{
		provider = "position",
		hl = inactive_hl,
		left_sep = {
			str = " ",
			hl = inactive_hl,
		},
		right_sep = {
			str = " ",
			hl = inactive_hl,
		},
	},
	{
		provider = "line_percentage",
		hl = inactive_hl,
		left_sep = {
			str = " ",
			hl = inactive_hl,
		},
		right_sep = {
			str = " ",
			hl = inactive_hl,
		},
	},
}

local common_mode_bg = t.PmenuSbar.bg.hex
local visual_bg = c.water.hex
local replace_bg = c.rose.hex
local insert_bg = c.leaf.hex

local vi_mode_colors = {
	NORMAL = common_mode_bg,
	OP = common_mode_bg,
	INSERT = insert_bg,
	VISUAL = visual_bg,
	LINES = visual_bg,
	BLOCK = visual_bg,
	REPLACE = replace_bg,
	["V-REPLACE"] = replace_bg,
	ENTER = common_mode_bg,
	MORE = common_mode_bg,
	SELECT = common_mode_bg,
	COMMAND = common_mode_bg,
	SHELL = common_mode_bg,
	TERM = insert_bg,
	NONE = common_mode_bg,
}

require("feline").setup {
	default_bg = t.StatusLine.bg.hex,
	default_fg = t.StatusLine.fg.hex,
	components = components,
	properties = properties,
	vi_mode_colors = vi_mode_colors,
}
