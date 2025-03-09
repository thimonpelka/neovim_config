local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescript", {
	s("lg", fmt('console.log("{}" + {})', { i(1, "text"), rep(1) })),
})
