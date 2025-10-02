-- Roslyn is necessary for code completion and other features for C# development in Neovim.
return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings
        broad_search = true,
        lock_target = true,
    },
}
