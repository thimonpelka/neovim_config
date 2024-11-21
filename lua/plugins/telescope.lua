return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		priority = 1000,
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>o", builtin.find_files, {
				desc = "Open File",
				silent = true,
			})
			vim.keymap.set("n", "<leader>f", builtin.live_grep, {
				desc = "Fuzzy Find",
				silent = true,
			})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {
				desc = "Search File History",
				silent = true,
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
