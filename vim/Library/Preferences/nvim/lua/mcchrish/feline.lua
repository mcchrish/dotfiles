local M = {}

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

	-- stylua: ignore start
	local c = {
		bg                        = t.StatusLine.bg.hex,
		fg                        = t.StatusLine.fg.hex,
		common_bg                 = t.PmenuSbar.bg.hex,
		common_fg                 = t.Folded.fg.hex,
		visual_bg                 = p.water.hex,
		replace_bg                = p.rose.hex,
		insert_bg                 = p.leaf.hex,
		diagnostic_error_fg       = t.LspDiagnosticsDefaultError.fg.hex,
		diagnostic_warning_fg     = t.LspDiagnosticsDefaultWarning.fg.hex,
		diagnostic_hint_fg        = t.LspDiagnosticsDefaultHint.fg.hex,
		diagnostic_information_fg = t.LspDiagnosticsDefaultInformation.fg.hex,
	}
	-- stylua: ignore end

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
			file_modified_icon = "●",
			file_readonly_icon = " ",
			icon = "",
		},
		{
			provider = "diagnostic_errors",
			enabled = function()
				return lsp.diagnostics_exist "Error"
			end,
			hl = { fg = c.diagnostic_error_fg },
			left_sep = " ",
			icon = "▬",
		},
		{
			provider = "diagnostic_warnings",
			enabled = function()
				return lsp.diagnostics_exist "Warning"
			end,
			hl = { fg = c.diagnostic_warning_fg },
			left_sep = " ",
			icon = "▪",
		},
		{
			provider = "diagnostic_hints",
			enabled = function()
				return lsp.diagnostics_exist "Hint"
			end,
			hl = { fg = c.diagnostic_hint_fg },
			left_sep = " ",
			icon = "▪",
		},
		{
			provider = "diagnostic_info",
			enabled = function()
				return lsp.diagnostics_exist "Information"
			end,
			hl = { fg = c.diagnostic_information_fg },
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
				fg = c.common_fg,
			},
			right_sep = " ",
		},
		{
			provider = "git_branch",
			hl = {
				fg = c.common_fg,
				bg = c.common_bg,
			},
			left_sep = {
				str = " ",
				hl = { bg = c.common_bg },
			},
			right_sep = {
				str = " ",
				hl = { bg = c.common_bg },
			},
			icon = " ",
		},
		{
			provider = "position",
			left_sep = " ",
			right_sep = {
				str = "|",
				hl = {
					fg = c.common_fg,
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
		NORMAL = c.common_bg,
		OP = c.common_bg,
		INSERT = c.insert_bg,
		VISUAL = c.visual_bg,
		LINES = c.visual_bg,
		BLOCK = c.visual_bg,
		REPLACE = c.replace_bg,
		["V-REPLACE"] = c.replace_bg,
		ENTER = c.common_bg,
		MORE = c.common_bg,
		SELECT = c.common_bg,
		COMMAND = c.common_bg,
		SHELL = c.common_bg,
		TERM = c.insert_bg,
		NONE = c.common_bg,
	}

	require("feline").setup {
		default_bg = c.default_bg,
		default_fg = c.default_fg,
		components = components,
		vi_mode_colors = vi_mode_colors,
		colors = {
			fg = c.fg,
			bg = c.bg,
		},
		force_inactive = {
			filetypes = {
				"packer",
			},
			buftypes = {
				"terminal",
			},
			bufnames = {},
		},
	}
end

return M
