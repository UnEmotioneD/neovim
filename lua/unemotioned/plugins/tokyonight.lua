return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      ---@type string | 'moon' | 'storm' | 'night' | 'day'
      style = 'night',
      transparent = false,
    })
    vim.cmd.colorscheme('tokyonight')

    -- change line number colors (from vscode catppuccin-mocha)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7F849C' })
  end,
}
