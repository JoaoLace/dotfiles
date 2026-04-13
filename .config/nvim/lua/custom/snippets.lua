return {
  'L3MON4D3/LuaSnip',
  opts = {},
  config = function()
    local ls = require 'luasnip'

    ls.add_snippets('markdown', {
      ls.snippet('typst', {
        ls.text_node { '```typst', '' },
        ls.insert_node(1),
        ls.text_node { '', '```' },
      }),
    })
  end,
}
