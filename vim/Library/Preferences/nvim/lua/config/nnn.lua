function copy_to_clipboard(lines)
	local joined_lines = table.concat(lines, "\n")
	vim.api.nvim_command("let @+ = '" .. joined_lines .. "'")
end

require("nnn").setup({
	command = "nnn -o -C",
	set_default_mappings = 0,
	replace_netrw = 1,
	action = {
		["<c-t>"] = "tab split",
		["<c-s>"] = "split",
		["<c-v>"] = "vsplit",
		["<c-o>"] = copy_to_clipboard,
	},
})
