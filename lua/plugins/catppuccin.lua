return {
	"catppuccin/nvim",
	name = "catppuccin",
	event = "BufWinEnter",
	priority = 1000,
	config = function()
		-- Catppuccin Theme
		require("catppuccin").setup()
		vim.cmd.colorscheme("catppuccin")
	end,
}
