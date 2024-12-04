-- Diangostics keybinds
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, {
	desc = "Go to next Diagnostics",
})

vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, {
	desc = "Go to prev Diagnostics",
})


return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		-- config = function()
		-- 	require("mason-lspconfig").setup({
		-- 		auto_install = true,
		-- 	})
		--
		-- 	local ok, mason_registry = pcall(require, "mason-registry")
		-- 	if not ok then
		-- 		vim.notify("mason-registry could not be loaded")
		-- 		return
		-- 	end
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- [[
			-- TYPESCRIPT
			-- ]]

			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end,
			})
			-- lspconfig.ts_ls.setup({
			-- 	capabilities = capabilities,
			-- })
			--
			-- -- [[
			-- -- SOLARGRAPH
			-- -- ]]
			--
			-- lspconfig.gopls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.solargraph.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.cssls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.html.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.lua_ls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.pylsp.setup({
			-- 	capabilities = capabilities,
			-- })

			local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()
			local cmd = {
				"C:\\Users\\thimo\\AppData\\Local\\nvim-data\\mason\\bin\\ngserver.cmd",
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

			lspconfig.angularls.setup({
				cmd = cmd,
				capabilities = capabilities,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
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
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_prefix = "",
			transparency = 10,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}
