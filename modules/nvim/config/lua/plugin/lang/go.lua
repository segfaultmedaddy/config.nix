return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "go" })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        -- @param opts lspconfig.options
        opts = {
            servers = {
                gopls = {},
            },
        },
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                go = { "goimports", "golines" },
            },
        },
    },

    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                go = { "golangcilint" },
            },
        },
    },
}
