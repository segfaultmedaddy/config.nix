return { -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "python" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ruff = {},
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
            },
        },
    },
}
