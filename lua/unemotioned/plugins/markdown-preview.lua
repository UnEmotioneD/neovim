return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
}
