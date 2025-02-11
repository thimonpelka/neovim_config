return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.gofumpt,
				-- null_ls.builtins.diagnostics.flake8,
				-- null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = { 
						-- "--ignore-missing-imports",
						"--follow-imports=silent",
						"--show-column-numbers",
						"--check-untyped-defs",
						"--strict",
						"--disallow-untyped-defs",
						"--disallow-incomplete-defs",
						"--disallow-untyped-calls",
					},
				}),
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
			-- debug = true,
		})

		vim.keymap.set("n", "<leader>cw", vim.diagnostic.open_float, {})
		vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, {})
	end,
}
