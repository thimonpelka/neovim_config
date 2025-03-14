
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("java", {
	s(
		"prf",
		fmt('System.out.println("{}: " + {});', {
			i(1, "var"),
			rep(1),
		})
	),
	s(
		"for",
		fmt("for({} : {}) {{\n\t{}\n}}", {
			i(1, "type"),
			i(2, "item"),
			i(0, { "" }),
		})
	),
	s(
		"test",
		fmt("@Test\npublic void test_{}() {{\n\t{}\n}}", {
			i(1, "name"),
			i(0, { "" }),
		})
	),
	s(
		"testclass",
		fmt("public class {}Test {{\n\n\t@Test\n\tpublic void test_{}() {{\n\t\t{}\n\t}}\n}}", {
			i(1, "name"),
			i(2, "name"),
			i(0, { "" }),
		})
	)
})
