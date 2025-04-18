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
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
    modified = {
      enable = true,
    },
    filters = {
      enable = true,
      custom = { '.DS_Store' },
    },
  },
}
