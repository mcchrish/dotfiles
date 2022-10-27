vim.g.user_emmet_mode = "i"
vim.g.user_emmet_leader_key = "<c-s>"
vim.g.user_emmet_install_global = 0

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"html",
		"css",
		"sass",
		"scss",
		"javascript",
		"vue",
		"typescriptreact",
		"markdown",
	},
	command = "EmmetInstall",
})
