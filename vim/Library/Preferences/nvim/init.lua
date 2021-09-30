require "impatient"

local g = vim.g

g.mapleader = [[ ]]
g.python3_host_prog = "/usr/bin/python3"
g.did_install_default_menus = 1
g.did_load_filetypes = 1

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

local packer = require "packer"
local util = require "packer.util"

packer.init {
	-- We want packer_compiled to load last
	compile_path = util.join_paths(vim.fn.stdpath "config", "plugin", "__packer_compiled.lua"),
}

packer.startup(function(use)
	use "lewis6991/impatient.nvim"
	use "nathom/filetype.nvim"
	use "wbthomason/packer.nvim"
	use { "~/vimming/zenbones.nvim", requires = "rktjmp/lush.nvim" }
	use { "famiu/feline.nvim", tag = "v0.2" }
	use { "dstein64/vim-startuptime", opt = true }
	use "folke/which-key.nvim"
	use "folke/trouble.nvim"
	use {
		"ibhagwan/fzf-lua",
		requires = "vijaymarupudi/nvim-fzf",
	}
	use { "junegunn/vim-easy-align", opt = true }
	use "~/vimming/nnn.vim"
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
		requires = {
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"nvim-lua/plenary.nvim",
		},
	}
	use "ms-jpq/coq_nvim"
	use "tpope/vim-fugitive"
	use { "rbong/vim-flog", opt = true }
	use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }
	use "lukas-reineke/indent-blankline.nvim"
	use {
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup()
		end,
		opt = true,
	}
	use "mbbill/undotree"
	use {
		"winston0410/commented.nvim",
		requires = "JoosepAlviste/nvim-ts-context-commentstring",
	}
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "nvim-treesitter/playground", opt = true }
	use { "mattn/emmet-vim", cmd = "EmmetInstall" }
	use "leafOfTree/vim-vue-plugin"
	-- use 'mcchrish/fountain.vim'
end)
