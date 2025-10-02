return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		opts = {},
		config = function()
			require("fzf-lua").setup({
                previewers = {
                    builtin = {
                        syntax_limit_b = 1024 * 100, -- 100KB
                    }
                }
            })
			local actions = require("fzf-lua").actions

			actions = {
				files = {
					-- ["<C-o>"] = actions.file_edit_or_qf,
					["<C-y>"] = actions.file_sel_to_qf,
					["ctrl-s"] = actions.file_vsplit,
					["ctrl-v"] = actions.file_split,
				},
			}

			vim.keymap.set("n", "<leader>o", ":FzfLua files<CR>", {
				desc = "Open File",
				silent = true,
			})
			vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>", {
				desc = "Fuzzy Find",
				silent = true,
			})
		end,
	},
}
