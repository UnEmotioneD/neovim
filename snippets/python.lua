local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    'main',
    fmt(
      [[
      def main() -> None:
          {}


      if __name__ == '__main__':
          main()
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(0, "print('Hello, world')"),
      }
    )
  ),
}
