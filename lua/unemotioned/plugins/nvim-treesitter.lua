return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = 'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'git_config',
        'gitignore',
        'html',
        'hyprlang',
        'java',
        'javascript',
        'json',
        'jsonc',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'norg',
        'python',
        'query',
        'regex',
        'tmux',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      vim.filetype.add({
        pattern = {
          ['.*/[^/]*bash[^/]*'] = 'bash',
          ['.*/hypr/.*%.conf'] = 'hyprlang',
        },
      }),
    })

    require('nvim-ts-autotag').setup({
      opts = {
        enable_close_on_slash = true,
      },
    })
  end,
}
