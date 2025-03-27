return {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 50 })
				-- neoscroll.zz({ half_win_duration = 250 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 50 })
				-- neoscroll.zz({ half_win_duration = 250 })
			end,
		}
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
