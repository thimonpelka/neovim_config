return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup({
				global_settings = {
					-- -- sets the marks upon calling 'toggle' in the ui, instead of require ':w'
					-- save_on_toggle = false,
					--
					-- -- saves the harpoon file upon every change
					-- save_on_change = true,
				},
			})


			-- Add current file to harpoon
			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add current file to harpoon" })

			vim.keymap.set("n", "<leader>hd", function()
				harpoon:list():remove()
			end, { desc = "Remove current file from harpoon" })


			-- Prev/Next
			vim.keymap.set("n", "<leader>hn", function()
				harpoon:list():next()
			end, { desc = "Go to next harpoon" })

			vim.keymap.set("n", "<leader>hp", function()
				harpoon:list():prev()
			end, { desc = "Go to prev harpoon" })



			-- Direct indexing 
			vim.keymap.set("n", "<leader>hu", function()
				harpoon:list():select(1)
			end, { desc = "Go to harpoon 1" })

			vim.keymap.set("n", "<leader>hi", function()
				harpoon:list():select(2)
			end, { desc = "Go to harpoon 2" })

			vim.keymap.set("n", "<leader>ho", function()
				harpoon:list():select(3)
			end, { desc = "Go to harpoon 3" })

			vim.keymap.set("n", "<leader>hq", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Go to harpoon 4" })


			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			-- Open harpoon window
			vim.keymap.set("n", "<leader>hf", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
}
