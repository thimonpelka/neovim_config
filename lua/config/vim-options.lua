vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number relativenumber")
-- vim.cmd("set cursorline=true")
-- vim.cmd("set autochdir")
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 15
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false

-- Use tabs instead of spaces
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.keymap.set({ "v", "n", "i" }, "<C-s>", "<Esc>:wa<CR>", {})
vim.keymap.set({ "v", "n", "i" }, "<C-a>", "<Esc>:wqa<CR>", {})
-- vim.keymap.set({ "v", "n", "i" }, "<C-d>", "<Esc>Vyp", {})
vim.keymap.set({ "n" }, "<leader>d", "<Esc>Vyp", {
	desc = "Duplicate Line"
})

vim.keymap.set('n', "<leader>l", ":Lazy<CR>", {
	desc = "Open Lazy"
})

vim.keymap.set('n', "<leader>cd", ":cd %:p:h<CR>", {
	desc = "Change working directory to current File"
})

vim.keymap.set("n", "<leader>qn", ":cnext<CR>", {
	desc = "Next item on quickfix list"
})

vim.keymap.set("n", "<leader>qp", ":cprev<CR>", {
	desc = "Next item on quickfix list"
})


vim.keymap.set("n", "<leader>C", ":e $MYVIMRC<CR>", {
	desc = "Open NVIM Config"
})
-- quickfix menu navigation:
-- vim.keymap.set("n", "<leader>lj", ":cnext<CR>", { desc="Forward qfixlist"})
-- vim.keymap.set("n", "<leader>lk", ":cprev<CR>", { desc="Backward qfixlist"})
