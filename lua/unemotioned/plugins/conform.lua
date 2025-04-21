return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      markdown = { 'prettierd' },
      json = { 'prettierd' },
      jsonc = { 'prettierd' },
      yaml = { 'prettierd' },
      toml = { 'taplo' },
    },
    default_format_opts = {
      async = false,
      quiet = false,
      lsp_format = 'fallback',
      timeout_ms = 1000,
    },
    format_on_save = {
      async = false,
      timeout_ms = 1000,
      lsp_fallback = 'fallback',
    },
  },
}
