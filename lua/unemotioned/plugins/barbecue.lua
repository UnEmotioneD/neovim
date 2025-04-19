return {
  'utilyre/barbecue.nvim',
  dependencies = 'SmiteshP/nvim-navic',
  config = function()
    require('barbecue').setup({
      show_dirname = true,
      show_basename = false,
    })

    vim.keymap.set('n', '<leader>b', function()
      require('barbecue.ui').toggle()
    end, { desc = 'Barbecue' })
  end,
}
