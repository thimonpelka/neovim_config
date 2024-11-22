vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number relativenumber")
-- vim.cmd("set autochdir")
vim.g.mapleader = " "

vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<Esc>:wa<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-a>", "<Esc>:wqa<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-d>", "<Esc>Vyp", {})

vim.keymap.set('n', "<leader>l", ":Lazy<CR>", {
	desc = "Open Lazy"
})


vim.keymap.set('n', "<leader>cd", ":cd %:p:h<CR>", {
	desc = "Change working directory to current File"
})

-- vim.keymap.set({ "v", "n", "i" }, "<C-l>", "<Esc>:wincmd l<CR>", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-k>", "<Esc>:wincmd k<CR>", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-j>", "<Esc>:wincmd j<CR>", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-h>", "<Esc>:wincmd h<CR>", {})

vim.keymap.set({ "v", "n", "i" }, "<C-i>", "<Esc>[{", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-m>", "<Esc>]}", {})


vim.keymap.set("n", "<leader>C", ":e $MYVIMRC<CR>", {
	desc = "Open NVIM Config"
})
-- quickfix menu navigation:
-- vim.keymap.set("n", "<leader>lj", ":cnext<CR>", { desc="Forward qfixlist"})
-- vim.keymap.set("n", "<leader>lk", ":cprev<CR>", { desc="Backward qfixlist"})
