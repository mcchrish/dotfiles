local M = {}

local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

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
			}
		end,
	},
	{
		provider = "file_info",
		type = "relative",
		hl = "StatusLine",
		file_modified_icon = "●",
		file_readonly_icon = " ",
		icon = "",
	},
	{
		provider = "diagnostic_errors",
		enabled = function()
			return lsp.diagnostics_exist "Error"
		end,
		hl = { fg = "diagnostic_error_fg" },
		left_sep = " ",
		icon = "▬",
	},
	{
		provider = "diagnostic_warnings",
		enabled = function()
			return lsp.diagnostics_exist "Warning"
		end,
		hl = { fg = "diagnostic_warning_fg" },
		left_sep = " ",
		icon = "▪",
	},
	{
		provider = "diagnostic_hints",
		enabled = function()
			return lsp.diagnostics_exist "Hint"
		end,
		hl = { fg = "diagnostic_hint_fg" },
		left_sep = " ",
		icon = "▪",
	},
	{
		provider = "diagnostic_info",
		enabled = function()
			return lsp.diagnostics_exist "Information"
		end,
		hl = { fg = "diagnostic_information_fg" },
		left_sep = " ",
		icon = "⋅",
	},
}

-- right
components.active[2] = {
	{
		provider = function()
			return vim.bo.filetype:lower()
		end,
		hl = {
			name = "FelineActiveText",
			fg = "common_fg",
		},
		right_sep = " ",
	},
	{
		provider = "git_branch",
		hl = {
			name = "FelineGitBranch",
			fg = "common_fg",
			bg = "common_bg",
		},
		left_sep = {
			str = " ",
			hl = "FelineGitBranch",
		},
		right_sep = {
			str = " ",
			hl = "FelineGitBranch",
		},
		icon = " ",
	},
	{
		provider = "position",
		hl = "StatusLine",
		left_sep = " ",
		right_sep = {
			str = "|",
			hl = "FelineActiveText",
		},
	},
	{
		provider = "line_percentage",
		hl = "StatusLine",
		left_sep = " ",
		right_sep = " ",
	},
}

local inactive_hl = "StatusLineNC"

components.inactive[1] = {
	{
		provider = " ",
		hl = inactive_hl,
		icon = "",
	},
	{
		provider = "file_info",
		type = "relative",
		file_modified_icon = "●",
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

local vi_mode_colors = {
	NORMAL = "common_bg",
	OP = "common_bg",
	INSERT = "insert_bg",
	VISUAL = "visual_bg",
	LINES = "visual_bg",
	BLOCK = "visual_bg",
	REPLACE = "replace_bg",
	["V-REPLACE"] = "replace_bg",
	ENTER = "common_bg",
	MORE = "common_bg",
	SELECT = "common_bg",
	COMMAND = "common_bg",
	SHELL = "common_bg",
	TERM = "insert_bg",
	NONE = "common_bg",
}

local force_inactive = {
	filetypes = {
		"packer",
	},
	buftypes = {
		"terminal",
	},
	bufnames = {},
}

M.setup = function()
	local t, p

	local colors_name = string.sub(vim.g.colors_name, 1, 8)
	if colors_name == "zenbones" then
		t = require "zenbones"
		p = require "zenbones.palette"
	else
		t = require "zenflesh"
		p = require "zenflesh.palette"
	end

	require("feline").setup {
		components = components,
		vi_mode_colors = vi_mode_colors,
		colors = {
			bg = t.StatusLine.bg.hex,
			fg = t.StatusLine.fg.hex,
			common_bg = t.PmenuSbar.bg.hex,
			common_fg = t.Folded.fg.hex,
			visual_bg = p.water.hex,
			replace_bg = p.rose.hex,
			insert_bg = p.leaf.hex,
			diagnostic_error_fg = t.LspDiagnosticsDefaultError.fg.hex,
			diagnostic_warning_fg = t.LspDiagnosticsDefaultWarning.fg.hex,
			diagnostic_hint_fg = t.LspDiagnosticsDefaultHint.fg.hex,
			diagnostic_information_fg = t.LspDiagnosticsDefaultInformation.fg.hex,
		},
		force_inactive = force_inactive,
	}
end

return M
