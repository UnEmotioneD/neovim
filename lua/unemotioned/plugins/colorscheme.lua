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

      on_highlights = function(highlights)
        -- Some colors to be more visible
        highlights.Comment.fg = '#7f849c'
        highlights.DiagnosticUnnecessary.fg = '#7f849c'
        highlights.LineNrAbove.fg = '#7f849c'
        highlights.LineNrBelow.fg = '#7f849c'
      end,
    })

    require('vague').setup()

    -- catppuccin, gruvbox, onedark, rose-pine, tokyonight, vague
    vim.cmd.colorscheme('tokyonight')
  end,
}
