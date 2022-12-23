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

require("lazy").setup({
	{ dir = "~/vimming/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
	{ "rktjmp/shipwright.nvim", lazy = true },
	"nvim-lualine/lualine.nvim",
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	"folke/which-key.nvim",
	"folke/trouble.nvim",
	"ibhagwan/fzf-lua",
	{ "junegunn/vim-easy-align", lazy = true },
	{ dir = "~/vimming/nnn.vim" },
	"andymass/vim-matchup",
	"ggandor/leap.nvim",
	"pgdouyon/vim-evanesco",
	"tpope/vim-eunuch",
	"tpope/vim-unimpaired",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-rsi",
	"kylechui/nvim-surround",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"nvim-lua/plenary.nvim",
	"jose-elias-alvarez/typescript.nvim",

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",

	"tpope/vim-fugitive",
	"junegunn/gv.vim",
	"lewis6991/gitsigns.nvim",
	"ruifm/gitlinker.nvim",
	"mbbill/undotree",

	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground", cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" } },
	"nvim-treesitter/nvim-treesitter-context",
	"lukas-reineke/indent-blankline.nvim",
	{ "mattn/emmet-vim", cmd = "EmmetInstall" },
	-- "mcchrish/fountain.vim",
}, {
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
