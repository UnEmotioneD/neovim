return {
  'shortcuts/no-neck-pain.nvim',
  version = '*',
  opts = {
    width = 90,
    mappings = {
      enabled = true,
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
