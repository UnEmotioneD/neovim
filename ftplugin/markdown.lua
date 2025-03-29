local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true

opt.textwidth = 80
-- Automatically wrap text using textwidth
opt.formatoptions:append('t')

-- vim.o.conceallevel = 2 -- for obsidian.nvim

-- Fold headers
opt.foldmethod = 'expr'
opt.foldexpr = "getline(v:lnum)=~'^\\s*#' ? '>' . (strlen(submatch(0)) - 1) : '='"

local map = vim.keymap.set

map('n', 'j', 'gj')
map('n', 'k', 'gk')

map('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

map('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = '[m]arkdown in [o]bsidian' })
