return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 0.9,
      width = 90,
    },
    plugins = {
      options = {
        ---@type integer 0 | 3
        laststatus = 3, -- 0 for lualine off, 3 for on
      },
    },
  },
}
