return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require('mason-lspconfig').setup({
      ensure_installed = {
        'typos_lsp',
        'lua_ls',
        'html',
        'cssls',
        'ts_ls',
        'emmet_ls',
        'pyright',
        'ruff', -- python LSP, linter, formatter
        'clangd',
        'taplo', -- toml LSP
        'marksman', -- markdown LSP
      },
      automatic_installation = true,
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'prettier',
        'eslint_d',
        'cpplint',
        'clang-format',
        'markdownlint',
      },
    })
  end,
}
