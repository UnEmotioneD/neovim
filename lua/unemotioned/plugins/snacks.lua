return {
  'folke/snacks.nvim',
  event = 'BufWinEnter',
  opts = {
    indent = {
      animate = {
        enabled = false,
      },
      scope = {
        underline = false,
        only_current = true,
      },
      chunk = {
        enabled = false,
        only_current = true,
      },
    },
    input = {
      enabled = true,
    },
  },
}
