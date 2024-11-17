return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>g",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Git",
		},
		{
			"<leader>s",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Show Code-Connection",
		},
		{
			"<leader>c",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Code Actions",
		},
	},
	config = function()
		require("which-key").setup()
	end,
}
