return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        -- Disable treesitter if file if bigger then 100 KB
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = {
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
        pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
      }),
    })
  end,
}
