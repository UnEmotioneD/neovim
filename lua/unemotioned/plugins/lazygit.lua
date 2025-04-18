return {
  'kdheepak/lazygit.nvim',
  event = 'VeryLazy',
  config = function()
    require('telescope').load_extension('lazygit')
  end,
}
