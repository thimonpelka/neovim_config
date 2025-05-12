-- Diangostics keybinds
vim.keymap.set("n", "-e", vim.diagnostic.goto_next, {
	desc = "Go to next Diagnostics",
})

vim.keymap.set("n", "-E", vim.diagnostic.goto_prev, {
	desc = "Go to prev Diagnostics",
})

return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		version = "1.10.0",
		-- lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		version = "1.32.0",
		-- lazy = false,
		opts = {
			ensure_installed = {
				"angularls",
				"autoflake",
				"black",
				"css-lsp cssls",
				"django-template-lsp",
				"eslint_d",
				"flake8",
				"gofumpt",
				"google-java-format",
				"gopls",
				"html-lsp html",
				"isort",
				"java_language_server",
				"jdtls",
				"lua_ls",
				"mypy",
				"prettier",
				"pylsp",
				"ruff",
				-- "stylua",
				"ts_ls",
			},
			auto_install = true,
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- ANGULAR
			local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()
			local user_home = vim.fn.expand("~")
			local mason_bin_path = user_home .. "\\AppData\\Local\\nvim-data\\mason\\bin\\ngserver.cmd"
			local cmd = {
				mason_bin_path,
				"--stdio",
				"--tsProbeLocations",
				table.concat({
					angularls_path,
					vim.uv.cwd(),
				}, ","),
				"--ngProbeLocations",
				table.concat({
					angularls_path .. "/node_modules/@angular/language-server",
					vim.uv.cwd(),
				}, ","),
			}

			lspconfig.glsl_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.angularls.setup({
				cmd = cmd,
				capabilities = capabilities,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
				end,
			})

			vim.keymap.set("n", "<leader>sk", vim.lsp.buf.hover, {
				desc = "Show Description",
			})
			vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, {
				desc = "Show Definition",
			})
			vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, {
				desc = "Show Reference",
			})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
			-- 	desc = "Show code action",
			-- })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
				desc = "Rename Variable Globally",
			})
		end,
	},
}
