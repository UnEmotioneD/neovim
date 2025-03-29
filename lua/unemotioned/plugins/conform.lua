return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'taplo' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      markdown = { 'prettier' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    },
  },
}
