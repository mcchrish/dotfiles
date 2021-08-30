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

local packer = require "packer"
local util = require "packer.util"

packer.init {
	-- We want packer_compiled to load last
	compile_path = util.join_paths(vim.fn.stdpath "config", "plugin", "__packer_compiled.lua"),
}

g.coc_global_extensions = {
	"coc-tsserver",
}

packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "~/vimming/zenbones.nvim"
	use { "folke/tokyonight.nvim", opt = true }
	use "folke/trouble.nvim"
	use "rktjmp/lush.nvim"
	use "/usr/local/opt/fzf"
	use "junegunn/fzf.vim"
	use { "junegunn/vim-easy-align", opt = true }
	use {
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	}
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
		},
	}
	use {
		"ms-jpq/coq_nvim",
		requires = { { "ms-jpq/coq.artifacts", branch = "artifacts" } },
		branch = "coq",
	}
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require "cmp"
			cmp.setup {
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<C-y>"] = cmp.mapping.confirm { select = true },
				},
				sources = {
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lsp" },
				},
			}
		end,
		opt = true,
	}
	use { "neoclide/coc.nvim", branch = "release", opt = true }
	use { "wellle/context.vim", opt = true }
	use "tpope/vim-fugitive"
	use { "rbong/vim-flog", opt = true }
	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
	}
	use {
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitlinker").setup()
		end,
		opt = true,
	}
	use { "mbbill/undotree", cmd = "UndotreeToggle" }
	use {
		"terrortylor/nvim-comment",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use { "nvim-treesitter/playground", opt = true }
	use { "mattn/emmet-vim", cmd = "EmmetInstall" }
	use { "leafOfTree/vim-vue-plugin" }
	-- use 'mcchrish/fountain.vim'
end)
