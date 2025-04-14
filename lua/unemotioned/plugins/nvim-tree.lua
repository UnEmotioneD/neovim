return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'stevearc/dressing.nvim',
  opts = {
    view = {
      side = 'left', ---@type 'left' | 'right'
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
  },
}
