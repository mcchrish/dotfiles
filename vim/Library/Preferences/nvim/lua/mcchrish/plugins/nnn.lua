return {
	{
		dir = "~/vimming/nnn.vim",
		opts = {
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
				["<c-w>"] = function(lines)
					local dir = lines[#lines]
					if vim.fn.filereadable(dir) then
						dir = vim.fn.fnamemodify(dir, ":h")
					end
					vim.api.nvim_command("cd " .. dir)
				end,
			},
		},
		config = function(_, opts)
			require("nnn").setup(opts)
		end,
	},
}
