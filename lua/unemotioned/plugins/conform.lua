return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      html = { 'prettier' }, -- prettier formats html to htmx
      css = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      markdown = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'taplo' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    },
  },
}
