return {
  'shortcuts/no-neck-pain.nvim',
  opts = {
    width = 90,
    mappings = {
      enabled = true,
      toggle = '<Leader>np',
      toggleLeftSide = '<Leader>nql',
      toggleRightSide = '<Leader>nqr',
      widthUp = '<Leader>n=',
      widthDown = '<Leader>n-',
      scratchPad = '<Leader>ns',
    },
    integrations = {
      NvimTree = {
        ---@type "left"|"right"
        position = 'left',
        reopen = true,
      },
      undotree = {
        ---@type "left"|"right"
        position = 'left',
      },
    },
  },
}
