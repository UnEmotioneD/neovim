return {
  'iamcco/markdown-preview.nvim',
  event = 'FileType markdown',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
}
