-- Add the same capabilities to ALL server configurations

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.keymap.set('n', "<leader>m", ":Mason<CR>", {
    desc = "Open Mason"
})

-- Diangostics keybinds
vim.keymap.set("n", "-e", vim.diagnostic.goto_next, {
    desc = "Go to next Diagnostics",
})

vim.keymap.set("n", "-E", vim.diagnostic.goto_prev, {
    desc = "Go to prev Diagnostics",
})

vim.keymap.set("n", "<leader>sk", vim.lsp.buf.hover, {
    desc = "Show Description",
})
vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, {
    desc = "Show Definition",
})
vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, {
    desc = "Show Reference",
})
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
-- 	desc = "Show code action",
-- })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
    desc = "Rename Variable Globally",
})

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "angularls",
                -- "autoflake",
                "cssls",
                -- "eslint_d",
                -- "google-java-format",
                -- "gopls",
                "html",
                -- "java_language_server",
                "jdtls",
                "lua_ls",
                -- "roslyn", -- install by hand
                -- "mypy",
                -- "pylsp",
                "ts_ls",
            },
            auto_install = true,
            automatic_installation = true,
        },
    },
}
