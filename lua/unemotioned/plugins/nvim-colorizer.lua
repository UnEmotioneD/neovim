return {
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = { '*' },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = false,
        AARRGGBB = false,
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

        ---@type string | 'foreground' | 'background' | 'virtualtext'
        mode = 'background',

        -- True is same as normal
        ---@type string | 'normal' | 'lsp' | 'both'
        ---@type boolean
        tailwind = false,

        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
        virtualtext = '■',
        always_update = false,
      },
      buftypes = {},
    },
  },
}
