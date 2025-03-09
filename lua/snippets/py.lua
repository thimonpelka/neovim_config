local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
	s(
		"prf",
		fmt('print(f"{}: {{{}}}")', {
			i(1, "var"),
			rep(1),
		})
	),
	s(
		"for",
		fmt("for {} in {}:\n\t{}", {
			i(1, "item"),
			i(2, "iterable"),
			i(0, { "" }),
		})
	),
	s(
		"def",
		fmt("def {}({}) -> {}:\n\t{}", {
			i(1, "func_name"),
			i(2, "args"),
			i(3, "return_type"),
			i(0, { "" }),
		})
	),
	s(
		"imp",
		fmt("import {}", {
			i(1, "module"),
		})
	),
	s(
		"from",
		fmt("from {} import {}", {
			i(1, "module"),
			i(2, "func"),
		})
	),
})
