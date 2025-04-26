return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'typos_lsp',
        'lua_ls',
        'html',
        'cssls',
        'ts_ls',
        'emmet_ls',
        'pyright', -- python LSP
        'clangd',
        'taplo', -- toml LSP
        'marksman', -- markdown LSP
      },
      automatic_installation = true,
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'prettierd',
        'eslint_d',
        'cpplint',
        'clang-format',
        'pylint',
        'isort', -- python import sorter
        'black', -- python formatter
        'markdownlint',
      },
    })
  end,
}
