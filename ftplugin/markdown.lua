local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true

opt.textwidth = 80
opt.formatoptions:append('t') -- Automatically wrap text using textwidth

-- vim.o.conceallevel = 2 -- for obsidian.nvim

-- Fold headers
opt.foldmethod = 'expr'
opt.foldexpr = "getline(v:lnum)=~'^\\s*#' ? '>' . (strlen(submatch(0)) - 1) : '='"

local map = vim.keymap.set

-- For navigatiung wrapped lines like normal lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

map('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

map('n', '<leader>mr', '<Cmd>RenderMarkdown toggle<CR>', { desc = '[m]arkdown [r]ender for current buffer' })

-- map('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = '[m]arkdown in [o]bsidian' })
