return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = false }, -- change it to true to replace dressing.nvim
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
    picker = { enabled = true },
    quickfile = { enabled = true },
    toggle = { enabled = true },
  },
  config = function()
    require('snacks').setup()
  end,
}
