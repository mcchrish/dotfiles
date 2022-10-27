local g = vim.g
local o = vim.o
local opt = vim.opt

o.modelines = 1
opt.fileformats = { "unix", "mac", "dos" }
o.fileformat = "unix"
o.timeoutlen = 600
o.ignorecase = true
o.smartcase = true
o.lazyredraw = true
o.inccommand = "split"

o.number = true
o.signcolumn = "yes"
o.updatetime = 250

-- Flash matching parenthesis
o.showmatch = true
o.matchtime = 2

-- Shorter messages
o.shortmess = "aIToOc"

-- Allow all mouse
o.mouse = "a"

-- Better splitting
o.splitbelow = true
o.splitright = true

-- Diff Mode
opt.diffopt = { "filler", "vertical" }

o.cursorline = true

o.scrolloff = 8
o.sidescrolloff = 10
o.synmaxcol = 500
o.history = 1000
o.tabpagemax = 50

-- Nicer vertical splits
opt.fillchars = { fold = "·" }
opt.listchars = { tab = "| ", eol = "¬", trail = "⣿", extends = "→", precedes = "←" }

-- Better completion
o.pumheight = 20

-- Visual-block can free move
o.virtualedit = "block"

-- 4 spaces indentation, no tabs
o.shiftwidth = 4
o.shiftround = true
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.breakindent = true
o.showbreak = "↪ "

o.selection = "exclusive"

-- Wrapping
o.linebreak = true
o.textwidth = 80
o.formatoptions = "cqj1" -- format using textwidth, including comments and gq

-- Stay on the same column if possible
o.startofline = false

-- Menu complete
o.wildignorecase = true
opt.wildmode = { "longest:full", "full" }
opt.wildignore:append { ".hg", ".git", ".svn", "*.pyc", "*.spl", "*.o", "*.out", "*.DS_Store" }
opt.wildignore:append { "*/node_modules/*" }

-- Dictionary
o.dictionary = "/usr/share/dict/words"

-- No need
o.swapfile = false

-- Persistent undo and swap files directory
o.undofile = true

o.backup = false
o.writebackup = false

opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:Cursor/lCursor",
	"i:blinkwait700-blinkoff400-blinkon250",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

g.PHP_noArrowMatching = 1
