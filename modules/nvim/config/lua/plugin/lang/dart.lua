return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "dart" })
        end,
    },

    {
        "nvim-flutter/flutter-tools.nvim",
        ft = "dart",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
            "saghen/blink.cmp",
            "mfussenegger/nvim-dap",
        },
        opts = {
            debugger = {
                enabled = true,
                exception_breakpoints = {},
            },
            lsp = {
                settings = {
                    renameFilesWithClasses = "always",
                    updateImportsOnRename = true,
                    completeFunctionCalls = true,
                    lineLength = 80,
                },
            },
            widget_guides = { enabled = true },
        },
        config = function(_, opts)
            opts.lsp.capabilities = require("blink.cmp").get_lsp_capabilities()
            require("flutter-tools").setup(opts)
        end,
    },
}
