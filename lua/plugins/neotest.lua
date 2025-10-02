return {
    {
        "nvim-neotest/neotest",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "Issafalcon/neotest-dotnet"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")
                },
                summary = {
                    open = "botright vsplit | vertical resize 80"
                }
            })


            vim.keymap.set("n", "<leader>tn", function()
                require("neotest").run.run()
            end, {
                desc = "Test Nearest",
                silent = true,
            })

            vim.keymap.set("n", "<leader>tf", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, {
                desc = "Test File",
                silent = true,
            })

            vim.keymap.set("n", "<leader>ts", function()
                require("neotest").summary.open()
            end, {
                desc = "Show Test Summary",
                silent = true,
            })

            vim.keymap.set("n", "<leader>to", function()
                require("neotest").output.open()
            end, {
                desc = "Show Test Output",
                silent = true,
            })
        end
    }
}
