return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  dependencies = {
    'ellisonleao/gruvbox.nvim',
    'navarasu/onedark.nvim',
    { 'rose-pine/neovim', name = 'rose-pine' },
    'folke/tokyonight.nvim',
    'vague2k/vague.nvim',
  },
  config = function()
    require('catppuccin').setup({
      ---@type 'latte'|'frappe'|'macchiato'|'mocha'
      flavour = 'mocha',
    })

    require('gruvbox').setup()

    require('onedark').setup({
      ---@type 'dark'|'darker'|'cool'|'deep'|'warm'|'warmer'
      style = 'deep',
    })

    require('rose-pine').setup({
      ---@type 'auto'|'main'|'moon'|'dawn'
      variant = 'moon',
    })

    require('tokyonight').setup({
      ---@type 'moon'|'storm'|'night'|'day'
      style = 'night',
    })

    require('vague').setup()

    -- catppuccin, gruvbox, onedark, rose-pine, tokyonight, vague
    vim.cmd.colorscheme('tokyonight')

    -- Change line number colors for better visibility (from vscode catppuccin-mocha)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7f849c' })
  end,
}
