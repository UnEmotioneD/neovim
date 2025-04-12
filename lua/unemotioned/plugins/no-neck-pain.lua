return {
  'shortcuts/no-neck-pain.nvim',
  version = '*',
  config = function()
    require('no-neck-pain').setup({
      width = 90,
      mappings = {
        enabled = true,
        toggle = '<leader>np',
        toggleLeftSide = '<leader>nql',
        toggleRightSide = '<leader>nqr',
        widthUp = '<leader>n=',
        widthDown = '<leader>n-',
        scratchPad = '<leader>ns',
      },
      integrations = {
        NvimTree = {
          position = 'left', ---@type "left"|"right"
          reopen = true,
        },
        undotree = {
          position = 'left', ---@type "left"|"right"
        },
      },
    })
  end,
}
