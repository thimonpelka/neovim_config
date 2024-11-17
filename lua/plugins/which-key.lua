return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		-- wk.setup()

		wk.add({
			{ "<leader>c", group = "Code Actions" },
			{ "<leader>s", group = "Code Connections" },
			{ "<leader>g", group = "Git" },
			{ "<leader>t", group = "TODOs" },
		})
	end,
}
