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
    default_format_opts = {
      async = false,
      quiet = false,
      lsp_format = 'fallback',
      timeout_ms = 1000,
    },
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 1000,
    },
  },
}
