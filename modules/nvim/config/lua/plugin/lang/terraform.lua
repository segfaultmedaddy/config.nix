return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "terraform" })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        -- @param opts lspconfig.options
        opts = {
            servers = {
                terraformls = {},
            },
        },
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                terraform = { "tofu_fmt" },
                ["terraform-vars"] = { "tofu_fmt" },
            },
        },
    },

    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                terraform = { "tofu" },
            },
        },
    },
}
