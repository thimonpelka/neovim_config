vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {
	desc = "Open Terminal",
})

vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", {
	desc = "Open Terminal",
})

vim.keymap.set("t", "<C-w>w", "<cmd>ToggleTerm<CR>", {
	desc = "Terminal to Background",
	noremap = true,
	silent = true,
})

vim.keymap.set("t", "<C-w>c", function()
	local term_buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_delete(term_buf, { force = true })
end, {
	desc = "Close Terminal",
	noremap = true,
	silent = true,
})

vim.opt.termguicolors = true

return {
	"akinsho/toggleterm.nvim",
	verions = "*",
	config = function()
		require("toggleterm").setup({
			-- Your existing toggleterm setup options
			open_mapping = [[<c-\>]],
			-- direction = "float", -- or "horizontal", "vertical", etc.
			shell = "pwsh",
			on_open = function(term)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-w>h",
					[[<C-\><C-n><C-w>h]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-w>j",
					[[<C-\><C-n><C-w>j]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-w>k",
					[[<C-\><C-n><C-w>k]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-w>l",
					[[<C-\><C-n><C-w>l]],
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}
