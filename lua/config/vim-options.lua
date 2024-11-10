vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<Esc>:w<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-a>", "<Esc>:wqa<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-d>", "<Esc>Vyp", {})

vim.keymap.set({ "v", "n", "i" }, "<C-l>", "<Esc>:wincmd l<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-k>", "<Esc>:wincmd k<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-j>", "<Esc>:wincmd j<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-h>", "<Esc>:wincmd h<CR>", {})

vim.keymap.set({ "v", "n", "i" }, "<C-i>", "<Esc>[{", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-m>", "<Esc>]}", {})
