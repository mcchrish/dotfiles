require "impatient"

local g = vim.g

g.mapleader = [[ ]]
g.python3_host_prog = "/usr/bin/python3"

local packer = require "packer"
local util = require "packer.util"

packer.init {
	-- We want packer_compiled to load last
	compile_path = util.join_paths(vim.fn.stdpath "config", "plugin", "__packer_compiled.lua"),
}

packer.startup(function(use)
	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use { "~/vimming/zenbones.nvim", requires = "rktjmp/lush.nvim" }
	use { "rktjmp/shipwright.nvim", opt = true }
	use "nvim-lualine/lualine.nvim"
	use { "dstein64/vim-startuptime", cmd = "StartupTime" }
	use "folke/which-key.nvim"
	use "folke/trouble.nvim"
	use "ibhagwan/fzf-lua"
	use { "junegunn/vim-easy-align", opt = true }
	use "~/vimming/nnn.vim"
	use "andymass/vim-matchup"
	use "ggandor/leap.nvim"
	use "pgdouyon/vim-evanesco"
	use "tpope/vim-eunuch"
	use "tpope/vim-unimpaired"
	use "tpope/vim-repeat"
	use "tpope/vim-sleuth"
	use "tpope/vim-rsi"
	use "kylechui/nvim-surround"
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"glepnir/lspsaga.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/plenary.nvim",
		"jose-elias-alvarez/typescript.nvim",
	}
	use {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	}
	use {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
	}
	use "tpope/vim-fugitive"
	use "junegunn/gv.vim"
	use "lewis6991/gitsigns.nvim"
	use "mbbill/undotree"
	use { "numToStr/Comment.nvim", "JoosepAlviste/nvim-ts-context-commentstring" }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" } }
	use "nvim-treesitter/nvim-treesitter-context"
	use "lukas-reineke/indent-blankline.nvim"
	use { "mattn/emmet-vim", cmd = "EmmetInstall" }
	-- use 'mcchrish/fountain.vim'
end)

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
