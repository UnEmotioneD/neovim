return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    lazy_load = false,
    user_default_options = {
      names = false,
      names_opts = {
        strip_digits = true,
      },
      css = true,
      css_fn = false,
      ---@type 'background' | 'foreground' | 'virtualtext'
      mode = 'virtualtext',
      virtualtext_inline = 'before',
    },
  },
}

