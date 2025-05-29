return {
	-- Unfortunately had to disable this plugin because i had an issue that when i open it it automatically goes into rename mode

	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			-- check the installation instructions at
			-- https://github.com/folke/snacks.nvim
			"folke/snacks.nvim",
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			-- {
			-- 	"<leader>e",
			-- 	mode = { "n", "v" },
			-- 	"<cmd>Yazi<cr>",
			-- 	desc = "Open yazi at the current file",
			-- 	noremap = true,
			-- 	silent = true,
			-- },
			{
				-- Open in the current working directory
				"<leader>w",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
				noremap = true,
				silent = true,
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
				copy_relative_path_to_selected_files = nil,
			},
			log_level = vim.log.levels.DEBUG,
			use_ya = false,
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function(_, opts)
			require("yazi").setup(opts)

			-- if you want to use snacks.nvim, you can do it like this
			require("snacks").setup({
				-- if you want to use snacks.nvim, you can do it like this
				-- more details:
			})

			vim.keymap.set("n", "<leader>e", function()
				vim.cmd("Yazi")
				-- Wait long enough for Yazi to open
				vim.defer_fn(function()
					-- Send escape a couple of times to ensure rename mode exits
					vim.api.nvim_chan_send(vim.b.terminal_job_id, "\27") -- ESC
					vim.api.nvim_chan_send(vim.b.terminal_job_id, "\27")
				end, 800)
			end, { desc = "Open Yazi", silent = true })
		end,
	},
}
