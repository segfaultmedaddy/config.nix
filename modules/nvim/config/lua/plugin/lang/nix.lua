return {
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "nix" })
            end
        end,
    },

    {
        "neovim/nvim-lspconfig",

        -- @param opts lspconfig.options
        opts = {
            servers = {
                nixd = {},
            },
        },
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                nix = { "nixfmt" },
            },
        },
    },
}
