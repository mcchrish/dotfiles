local opt = vim.opt

opt.modelines = 1
opt.fileformats = { "unix", "mac", "dos" }
opt.fileformat = "unix"
opt.ignorecase = true
opt.smartcase = true
-- opt.lazyredraw = true
opt.inccommand = "split"

opt.number = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 600

-- Flash matching parenthesis
opt.showmatch = true
opt.matchtime = 2

-- Shorter messages
opt.shortmess = "aIToOc"

-- Allow all mouse
opt.mouse = "a"

-- Better splitting
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Diff Mode
opt.diffopt:append {
	"linematch:50",
	"vertical",
	"foldcolumn:0",
	"indent-heuristic",
}

opt.cursorline = true

opt.scrolloff = 8
opt.sidescrolloff = 10
opt.synmaxcol = 500
opt.history = 1000
opt.tabpagemax = 50

opt.fillchars = { fold = "·" }
opt.listchars = { tab = "| ", nbsp = "␣", eol = "¬", trail = "⣿", extends = "→", precedes = "←" }

-- Better completion
opt.pumheight = 20

-- Visual-block can free move
opt.virtualedit = "block"

-- 4 spaces indentation, no tabs
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.breakindent = true
opt.showbreak = "↪ "

opt.selection = "exclusive"

-- Wrapping
opt.linebreak = true
opt.textwidth = 80
opt.formatoptions = "cqj1" -- format using textwidth, including comments and gq

-- Stay on the same column if possible
opt.startofline = false

-- Menu complete
opt.wildignorecase = true
opt.wildmode = { "longest:full", "full" }
opt.wildignore:append { ".hg", ".git", ".svn", "*.pyc", "*.spl", "*.o", "*.out", "*.DS_Store" }
opt.wildignore:append { "*/node_modules/*" }

-- Dictionary
opt.dictionary = "/usr/share/dict/words"

-- No need
opt.swapfile = false

-- Persistent undo and swap files directory
opt.undofile = true

opt.backup = false
opt.writebackup = false

opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:Cursor/lCursor",
	"i:blinkwait700-blinkoff400-blinkon250",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.g.PHP_noArrowMatching = 1

vim.diagnostic.config {
	update_in_insert = false,
	virtual_text = false,
	-- virtual_text = {
	-- 	spacing = 4,
	-- 	source = "if_many",
	-- },
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "▬",
			[vim.diagnostic.severity.WARN] = "▪",
			[vim.diagnostic.severity.HINT] = "▪",
			[vim.diagnostic.severity.INFO] = "⋅",
		},
	},
}
