local opt = vim.opt

-- UI
opt.relativenumber = true
opt.number = true
opt.signcolumn = 'yes'
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 5
opt.termguicolors = true
opt.background = 'dark'
opt.fillchars = { eob = ' ' }

-- Tabs & Indentation
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true
opt.autoindent = true
opt.startofline = true -- 'gg' to (0, 0)

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard & Backspace
opt.backspace = { 'indent', 'eol', 'start' }
opt.clipboard:append('unnamedplus')

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Timeouts
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 100

-- Files & Backups
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Spelling
opt.spell = false
opt.spelllang = { 'en', 'cjk' }
opt.spellsuggest = 'best'
opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'

-- Session Options
vim.o.sessionoptions = table.concat({
  'blank',
  'buffers',
  'curdir',
  'folds',
  'help',
  'tabpages',
  'winsize',
  'winpos',
  'terminal',
  'localoptions',
}, ',')

-- Disable Unused Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
