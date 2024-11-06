vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

require("config.lazy")


-- Catppuccin Theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "javascript", "go"},
	highlight = { enable = true },
	indent = { enable = true },
})
