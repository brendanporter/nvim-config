local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- iferr snippet
  s('iferr', {
    t 'if checkError(err) {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),
}
