return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
      only_scope = true,
      only_current = true,
      animate = {
        enabled = true,
        ---@type 'out' | 'up_down' | 'down' | 'up'
        style = 'out',
        duration = {
          step = 20, -- ms per step
          total = 500, -- maximum duration
        },
      },
      scope = {
        underline = true,
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
