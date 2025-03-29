-- Auto format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  buffer = 0, -- current buffer only
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Keymap to format manually
vim.keymap.set('n', '<leader>p', function()
  vim.lsp.buf.format({ async = true })
end, { buffer = true, desc = 'Format Python file' })
