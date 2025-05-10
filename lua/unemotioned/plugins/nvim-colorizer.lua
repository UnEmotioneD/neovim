return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    lazy_load = false,
    user_default_options = {
      names = true,
      names_opts = {
        strip_digits = true,
      },
      css = true,
      css_fn = false,
      ---@type 'background' | 'foreground' | 'virtualtext'
      mode = 'background',
      virtualtext_inline = 'before',
    },
  },
  config = function()
    require('colorizer').setup({
      -- filetypes to not enable on
      '!lazy',
      '!mason',
      '!vim',
    })
  end,
}
