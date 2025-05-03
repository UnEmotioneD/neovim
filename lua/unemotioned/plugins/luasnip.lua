return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  config = function()
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    luasnip.config.set_config({
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
    })

    cmp.setup({
      mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    })

    require('luasnip.loaders.from_lua').lazy_load({
      paths = { '~/.config/nvim/snippets' },
    })
  end,
}
