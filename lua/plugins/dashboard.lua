return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper", -- or 'doom', choose your preferred theme
			config = {
				header = { -- Custom ASCII art header (optional)
					"Welcome to Neovim!",
				},
				shortcut = {
					{ desc = "📝 New File", action = ":ene <BAR> startinsert <CR>", key = "n" },
					{ desc = "⚙️ Config", action = ":e $MYVIMRC", key = "c" },
				},
				footer = { "Have a productive day!" }, -- Footer message
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
