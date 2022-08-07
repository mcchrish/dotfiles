local g = vim.g

-- vim-matchup
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_offscreen = {}

-- undotree
g.undotree_WindowLayout = 2
g.undotree_SetFocusWhenToggle = 1
g.undotree_SplitWidth = 40

-- sneak
g["sneak#label"] = 1
g["sneak#use_ic_scs"] = 1

require("Comment").setup {
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if vim.bo.filetype == "typescriptreact" then
			local U = require "Comment.utils"

			-- Determine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring {
				key = type,
				location = location,
			}
		end
	end,
}

require("gitsigns").setup {
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "━" },
		topdelete = { text = "━" },
		changedelete = { text = "┳" },
	},
}

g.indent_blankline_filetype = { "yaml", "toml", "python" }
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_use_treesitter = true

require("which-key").setup {}

require("nvim-surround").setup {
	keymaps = {
		normal = "sa",
		normal_cur = "saa",
		visual = "s",
		delete = "sd",
		change = "sc",
	},
}
