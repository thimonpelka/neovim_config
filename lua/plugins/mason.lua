-- Add the same capabilities to ALL server configurations

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Diangostics keybinds
vim.keymap.set("n", "-e", vim.diagnostic.goto_next, {
    desc = "Go to next Diagnostics",
})

vim.keymap.set("n", "-E", vim.diagnostic.goto_prev, {
    desc = "Go to prev Diagnostics",
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
                "gopls",
                "html",
                "java_language_server",
                "jdtls",
                "lua_ls",
                -- "roslyn", -- install by hand
                -- "mypy",
                "pylsp",
                "ts_ls",
            },
            auto_install = true,
            automatic_installation = true,
        },
    },
}
