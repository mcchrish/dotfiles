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
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
				file_modified_icon = "●",
				file_readonly_icon = " ",
			},
		},
		hl = "StatusLine",
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
		hl = { fg = "diagnostic_warn_fg" },
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
		hl = { fg = "diagnostic_info_fg" },
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
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
				file_modified_icon = "●",
				file_readonly_icon = " ",
			},
		},
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
		"^packer$",
	},
	buftypes = {
		"terminal",
	},
	bufnames = {},
}

M.setup = function()
	local t
	if vim.g.colors_name == "zenbones" then
		t = require "zenbones"
	elseif vim.g.colors_name == "zenflesh" then
		t = require "zenflesh"
	elseif vim.g.colors_name == "rosebones" then
		t = require "rosebones"
	elseif vim.g.colors_name == "forestbones" then
		t = require "forestbones"
	elseif vim.g.colors_name == "neobones" then
		t = require "neobones"
	else
		return
	end

	require("feline").setup {
		components = components,
		vi_mode_colors = vi_mode_colors,
		colors = {
			bg = t.StatusLine.bg.hex,
			fg = t.StatusLine.fg.hex,
			common_bg = t.PmenuSbar.bg.hex,
			common_fg = t.Folded.fg.hex,
			visual_bg = t.DiagnosticInfo.fg.hex,
			replace_bg = t.DiagnosticError.fg.hex,
			insert_bg = t.MoreMsg.fg.hex,
			diagnostic_error_fg = t.DiagnosticError.fg.hex,
			diagnostic_warn_fg = t.DiagnosticWarn.fg.hex,
			diagnostic_hint_fg = t.DiagnosticHint.fg.hex,
			diagnostic_info_fg = t.DiagnosticInfo.fg.hex,
		},
		force_inactive = force_inactive,
	}
end

return M
