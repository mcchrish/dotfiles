return function()
	require("nnn").setup {
		command = "nnn -oCQ",
		set_default_mappings = 0,
		replace_netrw = 1,
		action = {
			["<c-t>"] = "tab split",
			["<c-s>"] = "split",
			["<c-v>"] = "vsplit",
			["<c-o>"] = function(lines)
				local joined_lines = table.concat(lines, "\n")
				vim.fn.setreg("+", joined_lines)
			end,
		},
	}
end
