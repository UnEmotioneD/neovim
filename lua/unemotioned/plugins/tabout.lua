return {
  {
    'abecodes/tabout.nvim',
    lazy = false,
    opts = {},
    priority = 1000,
    event = 'InsertCharPre',
  },
  {
    'L3MON4D3/LuaSnip',
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },
}
