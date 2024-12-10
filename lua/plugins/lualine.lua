return {
	"nvim-lualine/lualine.nvim",
	event = "BufWinEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
		})
	end,
}
