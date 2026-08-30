return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
            end
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ts_ls = {},
                eslint = {
                    settings = {
                        workingDirectory = { mode = "auto" },
                        format = true,
                    },
                },
            },
        },
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                prettier = {
                    ft_parsers = {
                        astro = "astro",
                    },
                },
            },
            formatters_by_ft = {
                astro = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
        },
    },
}
