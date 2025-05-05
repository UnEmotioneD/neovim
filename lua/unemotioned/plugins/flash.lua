return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    jump = {
      register = true, -- Can navigate with n and N
      nohlsearch = true, -- Clear highlight after jump
    },
    modes = {
      -- f, F, t and T motions
      char = {
        autohide = true, -- turn off enhanced 'find' and 'to' motion after one jump
      },
    },
  },
}
