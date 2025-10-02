return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        -- { "nvim-telescope/telescope.nvim" },
        { "ibhagwan/fzf-lua" },
    },
    event = "LspAttach",
    config = function()
        require("tiny-code-action").setup({
            backend = "vim",
        })


        vim.keymap.set("n", "<leader>ca", function()
            require("tiny-code-action").code_action()
        end, { noremap = true, silent = true, desc = "Open Code Action Menu" })
    end,
}
