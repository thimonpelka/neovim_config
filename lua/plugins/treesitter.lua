return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			-- Treesitter
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grk",
						scope_incremental = "grc",
						node_decremental = "grj",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["at"] = "@comment.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true, --whether to set jumpgs in the jump list
						goto_next_start = {
							["-f"] = { query = "@function.outer", desc="Function"},
							["-c"] = { query = "@class.outer", desc="Class"},
							["-l"] = { query = "@loop.outer", desc="Loop"},
							["-i"] = { query = "@conditional.outer", desc="Conditional"},
							["-t"] = { query = "@comment.outer", desc="Comment"},
							["-b"] = { query = "@block.outer", desc="Block"},
							["-p"] = { query = "@parameter.outer", desc="Parameter"},
						},
						goto_next_end = {
							["#f"] = { query = "@function.outer", desc="Function"},
							["#c"] = { query = "@class.outer", desc="Class"},
							["#l"] = { query = "@loop.outer", desc="Loop"},
							["#i"] = { query = "@conditional.outer", desc="Conditional"},
							["#t"] = { query = "@comment.outer", desc="Comment"},
						},
						goto_previous_start = {
							["-F"] = { query = "@function.outer", desc="Function"},
							["-C"] = { query = "@class.outer", desc="Class"},
							["-L"] = { query = "@loop.outer", desc="Loop"},
							["-I"] = { query = "@conditional.outer", desc="Conditional"},
							["-T"] = { query = "@comment.outer", desc="Comment"},
							["-B"] = { query = "@block.outer", desc="Block"},
							["-P"] = { query = "@parameter.outer", desc="Parameter"},
						},
						goto_previous_end = {
							["#F"] = { query = "@function.outer", desc="Function"},
							["#C"] = { query = "@class.outer", desc="Class"},
							["#L"] = { query = "@loop.outer", desc="Loop"},
							["#I"] = { query = "@conditional.outer", desc="Conditional"},
							["#T"] = { query = "@comment.outer", desc="Comment"},
						}
					},
				},
			})
		end,
	},
}
