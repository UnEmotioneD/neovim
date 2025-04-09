return {
  'nvim-treesitter/nvim-treesitter',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        'bash',
        'c',
        'css',
        'dockerfile',
        'gitignore',
        'git_config',
        'html',
        'hyprlang',
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
  end,
}
