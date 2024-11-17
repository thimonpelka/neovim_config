return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>tn", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "<leader>tp", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", {
				desc = "Open Todo List"
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
	},
}
