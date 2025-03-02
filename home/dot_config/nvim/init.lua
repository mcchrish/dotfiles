local g = vim.g
g.mapleader = [[ ]]
g.maplocalleader = [[,]]
g.python3_host_prog = "/usr/bin/python3"

g.did_install_default_menus = 1

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("mcchrish.plugins", {
	change_detection = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"matchit",
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logiPat",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"perl_provider",
				"python_provider",
				"rrhelper",
				"ruby_provider",
				"tar",
				"tarPlugin",
				"tutor",
				"tutor_mode_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})
