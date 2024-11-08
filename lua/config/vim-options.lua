vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<Esc>:w<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-a>", "<Esc>:wqa<CR>", {})
