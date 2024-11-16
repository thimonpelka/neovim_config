return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set({ "n" }, "<leader>ga", ":Git add .<CR>", {})
			vim.keymap.set({ "n" }, "<leader>gc", ":Git commit -a -m", {})
			vim.keymap.set({ "n" }, "<leader>gp", ":Git push<CR>", {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 0,
				},
			})
		end,
	},
}
