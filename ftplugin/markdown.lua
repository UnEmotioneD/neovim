local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true

opt.textwidth = 79
opt.formatoptions:append('t') -- Automatically wrap text using textwidth

-- Fold headers
opt.foldmethod = 'expr'
opt.foldexpr = "getline(v:lnum)=~'^\\s*#' ? '>' . (strlen(submatch(0)) - 1) : '='"

local map = vim.keymap.set

-- For navigatiung wrapped lines like normal lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

map('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

map('n', '<leader>mr', '<Cmd>RenderMarkdown toggle<CR>', { desc = '[m]arkdown [r]ender' })
