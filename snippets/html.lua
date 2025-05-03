local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

-- 느낌표(!, bang) 를 입력하고 자동완성에서 선택하면 아래와 같은 코드를 완성 시키고
--  <Tab>을 눌러서 커서를 i(1) 위치에서 i(0)으로 이동 할 수 있다
--  (prettier 로 포멧한 htmx 형식)
return {
  s(
    '!',
    fmt(
      [[
      <!doctype html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>{}</title>
          <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
          <link rel="stylesheet" type="text/css" href="style.css" />
          <style></style>
        </head>
        <body>
          <h3>{}</h3>
          <hr />
          {}
        </body>
        <script></script>
      </html>
      ]],
      {
        i(1),
        rep(1),
        i(0),
      }
    )
  ),
}
