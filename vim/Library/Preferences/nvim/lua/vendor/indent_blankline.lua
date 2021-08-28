return function()
	require("indent_blankline").setup {
		filetype = { "lua", "vue", "javascript", "typescript", "yaml", "toml", "python" },
		show_first_indent_level = false,
		use_treesitter = true,
	}
end
