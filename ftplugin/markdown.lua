vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.opt_local.textwidth = 79
vim.opt_local.formatoptions:append('t') -- Automatically wrap text using textwidth

-- For navigatiung wrapped lines like normal lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', 'gj', [[/^##\+ .*<cr>]], { desc = 'Jump to next header', buffer = true, silent = true })
vim.keymap.set('n', 'gk', [[?^##\+ .*<cr>]], { desc = 'Jump to prev header', buffer = true, silent = true })

vim.keymap.set('n', '<leader>mp', '<Cmd>MarkdownPreview<cr>', { desc = '[m]arkdown [p]erview' })
vim.keymap.set('n', '<leader>mr', '<Cmd>RenderMarkdown toggle<cr>', { desc = '[m]arkdown [r]ender' })
