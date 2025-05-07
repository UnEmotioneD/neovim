return {
  'mason-org/mason.nvim',
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
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
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'prettierd', -- prettier in daemeon as server
        'eslint_d',
        'cpplint',
        'clang-format',
        'pylint',
        'isort', -- python import sorter
        'blue', -- python formatter (use single quote by default)
        'markdownlint',
      },
    })
  end,
}
