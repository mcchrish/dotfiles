return function()
	require("indent_blankline").setup {
		filetype = { "lua", "vue", "javascript", "typescript" },
		show_first_indent_level = false,
		use_treesitter = true,
	}
end
