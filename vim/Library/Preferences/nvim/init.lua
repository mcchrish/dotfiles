local g = vim.g

g.mapleader = [[ ]]
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python3"
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
	"rrhelper",
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

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "pgdouyon/vim-yin-yang"
	use "/usr/local/opt/fzf"
	use "junegunn/fzf.vim"
	use { "~/vimming/nnn.vim", config = require "vendor.nnn" }
	use "andymass/vim-matchup"
	use "justinmk/vim-sneak"
	use "pgdouyon/vim-evanesco"
	use "tpope/vim-eunuch"
	use "tpope/vim-unimpaired"
	use "tpope/vim-repeat"
	use "tpope/vim-sleuth"
	use "tpope/vim-rsi"
	use "machakann/vim-sandwich"
	use {
		"neovim/nvim-lspconfig",
		requires = "jose-elias-alvarez/null-ls.nvim",
		config = require "vendor.lsp",
	}
	use { "ms-jpq/coq_nvim", branch = "coq" }
	use { "wellle/context.vim", cmd = "ContextToggle" }
	use "tpope/vim-fugitive"
	use { "rbong/vim-flog", cmd = { "Flog", "Flogsplit" } }
	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = require "vendor.gitsigns",
		event = "BufEnter",
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = require "vendor.indent_blankline",
		cmd = "IndentBlanklineToggle",
	}
	use {
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup()
		end,
		keys = "<leader>gy",
	}
	use { "mbbill/undotree", cmd = "UndotreeToggle" }
	use {
		"terrortylor/nvim-comment",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = require "vendor.comment",
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		config = require "vendor.treesitter",
		run = ":TSUpdate",
	}
	use { "mattn/emmet-vim", cmd = "EmmetInstall" }
	use { "leafOfTree/vim-vue-plugin" }
	-- use 'mcchrish/fountain.vim'
end)
