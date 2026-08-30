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
            "hrsh7th/cmp-nvim-lsp",
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
            opts.lsp.capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("flutter-tools").setup(opts)
        end,
    },
}
