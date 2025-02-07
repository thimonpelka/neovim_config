vim.keymap.set("i", "<C-Z>", 'copilot#Accept("<CR>")', {
	noremap = true,
	expr = true,
	-- silent = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		-- dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = {
				preset = "default",
				["<C-i>"] = { "select_and_accept" },

				-- Deactivate unneeded bindings
				["<C-y>"] = {},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = {
				enabled = true,
			},
		},
		opts_extend = { "sources.default" },
	},
	-- {
	-- 	"hrsh7th/cmp-nvim-lsp",
	-- 	after = "nvim-cmp",
	-- },
	-- {
	--
	-- 	"saadparwaiz1/cmp_luasnip",
	-- 	event = "InsertEnter",
	-- },
	-- {
	-- 	"rafamadriz/friendly-snippets",
	-- 	event = "InsertEnter",
	-- },
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	event = "CursorMoved",
	-- },
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = { "InsertEnter", "CmdlineEnter" },
	-- 	-- after = "nvim-lspconfig",
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	--
	-- 		cmp.setup({
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					require("luasnip").lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			window = {
	-- 				completion = cmp.config.window.bordered(),
	-- 				documentation = cmp.config.window.bordered(),
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				-- ["<C-e>"] = cmp.mapping.abort(),
	-- 				["<CR>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						if luasnip.expandable() then
	-- 							luasnip.expand()
	-- 						else
	-- 							cmp.confirm({ select = true })
	-- 						end
	-- 					else
	-- 						fallback() -- This allows Telescope to handle <CR>
	-- 					end
	-- 				end),
	-- 				["<Tab>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					elseif luasnip.locally_jumpable(1) then
	-- 						luasnip.jump(1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	--
	-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.locally_jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 			}),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "luasnip" }, -- For luasnip users.
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 			experimental = {
	-- 				-- ghost_text = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
