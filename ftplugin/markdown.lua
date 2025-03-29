local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true

opt.textwidth = 80
opt.formatoptions:append('t') -- wrap text using textwidth

-- fold headers
opt.foldmethod = 'expr'
opt.foldexpr = "getline(v:lnum)=~'^\\s*#' ? '>' . (strlen(submatch(0)) - 1) : '='"

local map = vim.keymap.set

-- for navigatiung wrapped lines like normal lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

map('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })
