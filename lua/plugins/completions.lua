vim.keymap.set("i", "<C-Z>", 'copilot#Accept("<CR>")', {
	noremap = true,
	expr = true,
	-- silent = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

local trigger_text = ";"

return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "2.*" },
		},

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
				preset = "none",
				["<C-l>"] = { "select_and_accept", "fallback" },
				["<C-k>"] = { "select_prev", "hide" },
				["<C-j>"] = { "select_next", "show", "hide" },
				["<C-h>"] = { "show" },

				["<C-p>"] = { "fallback_to_mappings" },
				["<C-n>"] = { "fallback_to_mappings" },

				-- Deactivate unneeded bindings
				-- ["<C-y>"] = {},
				-- ["<Tab>"] = { "snippet_forward" },
				-- ["<S-Tab>"] = {},
				-- ["<Tab>"] = { "snippet_forward", "fallback" },
				-- ["<S-Tab>"] = { "snippet_backward", "fallback" },
				-- ["<Tab>"] = {
				-- 	function(cmp)
				-- 		if cmp.visible() then
				-- 			cmp.select_next_item()
				-- 			return true
				-- 		elseif cmp.snippet_forward() then
				-- 			-- Jumps to next snippet placeholder
				-- 			return true
				-- 		else
				-- 			return false
				-- 		end
				-- 	end,
				-- },

				-- ["<S-Tab>"] = {
				-- 	function(fallback)
				-- 		if require("blink").cmp.visible() then
				-- 			require("blink").cmp.select_prev_item()
				-- 		elseif require("blink").cmp.snippet_backward() then
				-- 			-- Jumps to previous snippet placeholder
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end,
				-- },
			},

			snippets = {
				preset = "luasnip",
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

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						-- Disable completion for some LSP servers
					},
					snippets = {
						-- Disable snippets for some filetypes
						score_offset = 1000,
						-- should_show_items = function()
						-- 	local col = vim.api.nvim_win_get_cursor(0)[2]
						-- 	local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
						-- 	-- NOTE: remember that `trigger_text` is modified at the top of the file
						-- 	return before_cursor:match(trigger_text .. "%w*$") ~= nil
						-- end,
						-- -- After accepting the completion, delete the trigger_text characters
						-- -- from the final inserted text
						-- -- Modified transform_items function based on suggestion by `synic` so
						-- -- that the luasnip source is not reloaded after each transformation
						-- -- https://github.com/linkarzu/dotfiles-latest/discussions/7#discussion-7849902
						-- transform_items = function(_, items)
						-- 	local col = vim.api.nvim_win_get_cursor(0)[2]
						-- 	local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
						-- 	local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
						-- 	if trigger_pos then
						-- 		for _, item in ipairs(items) do
						-- 			if not item.trigger_text_modified then
						-- 				---@diagnostic disable-next-line: inject-field
						-- 				item.trigger_text_modified = true
						-- 				item.textEdit = {
						-- 					newText = item.insertText or item.label,
						-- 					range = {
						-- 						start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
						-- 						["end"] = { line = vim.fn.line(".") - 1, character = col },
						-- 					},
						-- 				}
						-- 			end
						-- 		end
						-- 	end
						-- 	return items
						-- end,
					},
				},
			},

			signature = {
				enabled = true,
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		dependencies = {
			-- Optional: Add snippet collections
		},
		config = function()
			require("luasnip").setup({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})

			-- Load friendly-snippets if you added it as a dependency
			-- Get the appropriate path separator based on OS
			local path_separator = vim.loop.os_uname().sysname:match("Windows") and "\\" or "/"

			-- Build paths that work on both Windows and Linux
			local config_path = vim.fn.stdpath("config")
			local snippets_path = config_path .. path_separator .. "lua" .. path_separator .. "snippets"

			-- Load snippets from your config directory
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { snippets_path },
			})

			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if require("luasnip").jumpable(1) then
					require("luasnip").jump(1)
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				end
			end, { silent = true })
		end,
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
