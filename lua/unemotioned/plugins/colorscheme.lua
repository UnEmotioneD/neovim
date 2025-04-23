local cat = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      ---@type 'latte' | 'frappe' | 'macchiato' | 'mocha'
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

    -- change line number colors (from vscode catppuccin-mocha)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7f849c' })
  end,
}

local dark = {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    require('onedark').load()
  end,
  opts = {
    ---@type 'dark' | 'darker' | 'cool' | 'deep' | 'warm' | 'warmer' | 'light'
    style = 'deep',
    transparent = false,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,

    toggle_style_key = '<leader>tt',
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' },

    -- italic, bold, underline, none
    code_style = {
      comments = 'none',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none',
    },
  },
}

local gruv = {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('gruvbox')
  end,
  opts = {
    transparent_mode = false,
  },
}

local rose = {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    require('rose-pine').setup({
      ---@type 'main' | 'moon' | 'dawn'
      variant = 'main',
      styles = {
        transparency = false,
      },
    })
    vim.cmd.colorscheme('rose-pine')
  end,
}

local tokyo = {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('tokyonight')

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7f849c' })
  end,
  opts = {
    ---@type 'moon' | 'storm' | 'night' | 'day'
    style = 'night',
    transparent = false,
  },
}

local vague = {
  'vague2k/vague.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('vague')
  end,
  opts = {
    transparent = false,
    -- 'none' | 'default' | 'bold' | 'italic'
    style = {
      boolean = 'none',
      number = 'none',
      float = 'none',
      error = 'none',
      comments = 'none',
      conditionals = 'none',
      functions = 'none',
      headings = 'none',
      operators = 'none',
      strings = 'none',
      variables = 'none',

      keywords = 'none',
      keyword_return = 'none',
      keywords_loop = 'none',
      keywords_label = 'none',
      keywords_exception = 'none',

      builtin_constants = 'none',
      builtin_functions = 'none',
      builtin_types = 'none',
      builtin_variables = 'none',
    },
    plugins = {
      cmp = {
        match = 'none',
        match_fuzzy = 'none',
      },
      lsp = {
        diagnostic_hint = 'none',
        diagnostic_info = 'none',
        diagnostic_warn = 'none',
        diagnostic_error = 'none',
      },
      telescope = {
        match = 'none',
      },
    },
  },
}

return tokyo
