local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
	s("print", {
		t("print(f\""),
		i(1, "text"),
		t(":, "),
		i(2, "var"),
		t("\")"),
		i(0),
	}),
	s("for", {
		t("for "),
		i(1, "item"),
		t(" in "),
		i(2, "iterable"),
		t(":"),
		i(0),
	}),
})
