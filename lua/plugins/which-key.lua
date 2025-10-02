return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		-- wk.setup()

		wk.add({
			{ "<leader>c", group = "Code Actions" },
			{ "<leader>s", group = "Show" },
			-- { "<leader>g", group = "Git" },
			{ "<leader>t", group = "Test" },
			{ "<leader>k", group = "TODOs" },
			{ "<leader>q", group = "QuickFix"},
			{ "<leader>n", group = "Neogen"},
		})
	end,
}
