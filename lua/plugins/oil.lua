return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			delete_to_trash = true, -- Whether to delete files to trash instead of permanently
			skip_confirm_for_simple_edits = true, -- Whether to skip confirmation for simple edits like renaming a file
			view_options = {
				-- natural_order = true, -- Whether to sort files naturally (e.g., "file1", "file2", "file10")
			}
		},
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
					["s"] = { "actions.select", opts = { vertical = true } },
					["r"] = {"actions.parent", mode = "n"},
					["ö"] = "actions.select",
				}
			})

			vim.keymap.set("n", "<leader>e", function()
				require("oil").open()
			end, { desc = "Open Oil" })
			vim.keymap.set("n", "r", function()
				require("oil").open()
			end, { desc = "Open Oil" })
		end,
	},
}
