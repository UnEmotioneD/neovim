local cat = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      ---@type string | 'latte' | 'frappe' | 'macchiato' | 'mocha'
      flavour = 'mocha',
      transparent_background = false,
      color_overrides = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        harpoon = true,
        mason = true,
        notify = false,
        nvim_surround = true,
        treesitter = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme('catppuccin')
  end,
}

local gruv = {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  lazy = false,
  priority = 1000,
  config = function()
    require('gruvbox').setup({
      transparent_mode = false,
    })
    vim.cmd.colorscheme('gruvbox')
  end,
}

local rose = {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  config = function()
    require('rose-pine').setup({
      ---@type string | 'main' | 'moon' | 'dawn'
      variant = 'moon',
      styles = {
        transparency = false,
      },
    })

    vim.cmd.colorscheme('rose-pine')
  end,
}

local tokyo = {
  'folke/tokyonight.nvim',
  name = 'tokyonight',
  lazy = false,
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

return tokyo
