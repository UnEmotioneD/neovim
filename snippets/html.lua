local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- 느낌표(!, bang) 를 입력하고 자동완성에서 선택하면 아래와 같은 코드를 완성 시키고
--  <Tab>을 눌러서 커서를 i(1) 위치에서 i(0)으로 이동 할 수 있다
--  (prettier 로 포멧한 htmx 형식)
return {
  s('!', {
    t('<!doctype html>'),
    t({ '', '<html lang="en">' }),
    t({ '', '  <head>' }),
    t({ '', '    <meta charset="UTF-8" />' }),
    t({ '', '    <meta name="viewport" content="width=device-width, initial-scale=1.0" />' }),
    t({ '', '    <title>' }),
    i(1),
    t('</title>'),
    t({ '', '    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>' }),
    t({ '', '    <link rel="stylesheet" href="style.css" />' }),
    t({ '', '    <style></style>' }),
    t({ '', '  </head>' }),
    t({ '', '  <body>' }),
    t({ '', '    ' }),
    i(0),
    t({ '', '  </body>' }),
    t({ '', '  <script></script>' }),
    t({ '', '</html>' }),
  }),
}
