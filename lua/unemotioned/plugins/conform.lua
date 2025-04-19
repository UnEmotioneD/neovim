return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      markdown = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
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
