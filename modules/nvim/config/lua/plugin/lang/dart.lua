return {
    treesitter = { "dart" },
    setup = function()
        require("flutter-tools").setup({
            debugger = {
                enabled = true,
                exception_breakpoints = {},
            },
            lsp = {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
                settings = {
                    renameFilesWithClasses = "always",
                    updateImportsOnRename = true,
                    completeFunctionCalls = true,
                    lineLength = 80,
                },
            },
            widget_guides = { enabled = true },
        })
    end,
}
