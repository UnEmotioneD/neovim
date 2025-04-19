-- :so[urce] %
--  for the changes made to take effect

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
opt.fillchars:append({ eob = ' ' })

-- Performance
opt.updatetime = 200

-- Tabs & Indentation
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true
opt.autoindent = true
opt.startofline = true -- 'gg' to (0, 0)

-- nosplit is default
--  when doing :%s/ command it will show the matches in split window
---@type 'nosplit' | 'split' | ''
opt.inccommand = 'split'

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
opt.spelllang = { 'en', 'cjk' }
opt.spellsuggest = 'best'
-- opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'

-- Session Options
opt.sessionoptions = table.concat({
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

-- disable netrw from nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Unused Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.deprecation_warnings = false
