return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
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
      timeout_ms = 1000,
      async = false, -- change not recommend
      quiet = false, -- change not recommend
      lsp_format = 'fallback',
    },
    format_on_save = {
      timeout_ms = 1000,
      async = false, -- change not recommend
      quiet = false, -- change not recommend
      lsp_format = 'fallback',
    },
  },
}
