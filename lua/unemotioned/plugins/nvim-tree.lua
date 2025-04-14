return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'stevearc/dressing.nvim',
  config = function()
    require('nvim-tree').setup({
      view = {
        ---@type 'left' | 'right'
        side = 'left',
        relativenumber = true,
        width = 40,
      },
      renderer = {
        indent_markers = {
          enable = true,
          inline_arrows = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
            },
          },
        },
      },
      git = {
        enable = false,
      },
      diagnostics = {
        enable = false,
      },
      modified = {
        enable = false,
      },
      filters = {
        enable = true,
        custom = { '.DS_Store' },
      },
    })
  end,
}
