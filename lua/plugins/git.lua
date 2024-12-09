return {
	-- {
	-- 	"tpope/vim-fugitive",
	-- 	config = function()
	-- 		vim.keymap.set({ "n" }, "<leader>ga", ":Git add .<CR>", {
	-- 			desc = "Git add .",
	-- 		})
	-- 		vim.keymap.set({ "n" }, "<leader>gc", ":Git commit -a -m", {
	-- 			desc = "Git commit",
	-- 		})
	-- 		vim.keymap.set({ "n" }, "<leader>gP", ":Git pull<CR>", {
	-- 			desc = "Git pull",
	-- 		})
	-- 		vim.keymap.set({ "n" }, "<leader>gp", ":Git push<CR>", {
	-- 			desc = "Git push",
	-- 		})
	-- 		vim.keymap.set({ "n" }, "<leader>gs", ":Git status<CR>", {
	-- 			desc = "Git status",
	-- 		})
	-- 	end,
	-- },
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
	-- {
	-- 	"kdheepak/lazygit.nvim",
	-- 	lazy = true,
	-- 	cmd = {
	-- 		"LazyGit",
	-- 		"LazyGitConfig",
	-- 		"LazyGitCurrentFile",
	-- 		"LazyGitFilter",
	-- 		"LazyGitFilterCurrentFile",
	-- 	},
	-- 	-- optional for floating window border decoration
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- 	-- order to load the plugin when the command is run for the first time
	-- 	keys = {
	-- 		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	-- 	},
	-- },
}
