return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function(_, opts)
			require("oil").setup({
				opts,
				keymaps = {
					["<C-s>"] = {},
					["<C-v>"] = { "actions.select", opts = { vertical = true } },
					["s"] = {"actions.parent", mode = "n"},
					["ö"] = "actions.select",
				}
			})

			vim.keymap.set("n", "<leader>e", function()
				require("oil").open()
			end, { desc = "Open Oil" })
		end,
	},
}
