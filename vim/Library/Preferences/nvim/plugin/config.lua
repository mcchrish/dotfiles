local g = vim.g
local opt = vim.opt

opt.hidden = true
opt.modelines = 1
opt.fileformats = { "unix", "mac", "dos" }
opt.fileformat = "unix"
opt.timeoutlen = 700
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.inccommand = "split"

opt.number = true
opt.signcolumn = "number"

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

-- Diff Mode
opt.diffopt = { "filler", "vertical" }

opt.cursorline = true

opt.scrolloff = 8
opt.sidescrolloff = 10
opt.synmaxcol = 500
opt.history = 1000
opt.tabpagemax = 50

opt.joinspaces = false

-- Nicer vertical splits
opt.fillchars = { vert = " ", fold = "·" }
opt.listchars = { tab = "| ", eol = "¬", trail = "⣿", extends = "→", precedes = "←" }

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
opt.wildmode = { longest = "full", "full" }
opt.wildignore = opt.wildignore + { ".hg", ".git", ".svn", "*.pyc", "*.spl", "*.o", "*.out", "*.DS_Store" }
opt.wildignore = opt.wildignore + { "*/node_modules/*" }

-- Dictionary
opt.dictionary = "/usr/share/dict/words"

-- No need
opt.swapfile = false

-- Persistent undo and swap files directory
opt.undofile = true

opt.backup = false
opt.writebackup = false

g.PHP_noArrowMatching = 1
