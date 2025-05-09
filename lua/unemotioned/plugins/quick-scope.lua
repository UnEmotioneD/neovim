return {
  'unblevable/quick-scope',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.keymap.set('n', '<leader>tq', ':QuickScopeToggle<CR>', { desc = 'Toggle quick-scope' })
  end,
}
