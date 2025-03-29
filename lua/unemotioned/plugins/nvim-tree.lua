return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require('nvim-tree')

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = false,
        icons = {
          show = {
            file = true, -- You can toggle this to false to debug
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
            },
          },
        },
      },
      git = {
        enable = false, -- Disable Git integration for debugging
      },
      filters = {
        custom = { '.DS_Store' },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })
  end,
}
