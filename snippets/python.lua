local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('main', {
    t('def main() -> None:'),
    t({ '', '    print("Hello, world")' }),
    i(1),
    t({ '', '' }),
    t({ '', '' }),
    t({ '', 'if __name__ == "__main__":' }),
    t({ '', '    main()' }),
  }),
}
