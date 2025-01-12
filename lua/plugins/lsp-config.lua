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
		cmd = "Mason",
		-- lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		-- lazy = false,
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
		after = "LuaSnip",
		-- lazy = false,
		config = function()
			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end,
			})

			-- In your LSP config, before the general handler
			-- lspconfig.pyright.setup({
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		python = {
			-- 			analysis = {
			-- 				typeCheckingMode = "basic",
			-- 			},
			-- 		},
			-- 	},
			-- 	-- Enable formatting
			-- 	on_attach = function(client, bufnr)
			-- 		client.server_capabilities.documentFormattingProvider = true
			-- 	end,
			-- })

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
