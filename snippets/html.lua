local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

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
    t({ '', '    <link rel="stylesheet" href="" />' }),
    t({ '', '    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>' }),
    t({ '', '  </head>' }),
    t({ '', '  <body>' }),
    t({ '', '    ' }),
    i(0),
    t({ '', '  </body>' }),
    t({ '', '</html>' }),
  }),
}
