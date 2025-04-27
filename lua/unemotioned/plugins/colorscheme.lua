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
      no_italic = true,
      no_bold = true,
      integrations = {
        flash = false,
        mason = true,
      },
    })

    require('gruvbox').setup({
      bold = false,
      italic = {
        comments = false,
        emphasis = false,
        strings = false,
      },
    })

    require('onedark').setup({
      ---@type 'dark'|'darker'|'cool'|'deep'
      style = 'deep',
      toggle_style_key = '<leader>tt',
      toggle_style_list = { 'dark', 'darker', 'cool', 'deep' },
      code_style = {
        comments = 'none',
      },
    })

    require('rose-pine').setup({
      ---@type 'main'|'moon'
      variant = 'main',
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    })

    require('tokyonight').setup({
      ---@type 'moon'|'storm'|'night'
      style = 'night',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        -- From Vague.nvim
        hl.Comment.fg = '#5f607b'
        hl.DiagnosticUnnecessary.fg = '#5f607b'
        hl.LineNrAbove.fg = '#5f607b'
        hl.LineNrBelow.fg = '#5f607b'

        local prompt = '#2d3149'
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })

    require('vague').setup({
      style = {
        boolean = 'none',
        error = 'none',
        comments = 'none',
        headings = 'none',
        strings = 'none',

        keyword_return = 'none',

        builtin_constants = 'none',
        builtin_types = 'none',
      },
      plugins = {
        cmp = {
          match = 'none',
          match_fuzzy = 'none',
        },
        lsp = {
          diagnostic_info = 'none',
          diagnostic_warn = 'none',
          diagnostic_error = 'none',
        },
        telescope = {
          match = 'none',
        },
      },
    })

    ---@type 'catppuccin'|'gruvbox'|'onedark'|'rose-pine'|'tokyonight'|'vague'
    local theme = 'tokyonight'
    vim.cmd.colorscheme(theme)
  end,
}
