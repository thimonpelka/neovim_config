
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
			require("oil").setup(opts)

			vim.keymap.set("n", "<leader>O", function()
				require("oil").open()
			end, { desc = "Open Oil" })
		end,
	},
}
