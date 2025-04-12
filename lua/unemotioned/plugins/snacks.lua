return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      animate = { enabled = false },
      scope = {
        underline = false,
        only_current = true,
      },
      chunk = {
        enabled = false,
        only_current = true,
      },
    },
    input = { enabled = false }, -- change it to true to replace dressing.nvim
    picker = { enabled = true },
    quickfile = { enabled = true },
    toggle = { enabled = true },
  },
}
