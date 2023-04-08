local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	}
end
vim.opt.runtimepath:prepend(lazypath)

local g = vim.g

g.mapleader = [[ ]]
g.python3_host_prog = "/usr/bin/python3"

require("lazy").setup("mcchrish.plugins", {
	ui = {
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			source = "📄",
			start = "🚀",
			task = "📌",
		},
	},
})

g.did_install_default_menus = 1

local disabled_built_ins = {
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
	"tutor_mode_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for i = 1, #disabled_built_ins do
	g["loaded_" .. disabled_built_ins[i]] = 1
end
