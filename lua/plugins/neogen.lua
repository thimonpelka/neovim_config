vim.keymap.set("n", "<Leader>nf", ":lua require('neogen').generate()<CR>")

return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
