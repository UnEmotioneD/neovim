return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
}
