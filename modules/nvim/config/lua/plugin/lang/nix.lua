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
        "nvimtools/none-ls.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "williamboman/mason.nvim",
        },
        -- opts = function(_, opts)
        --   local nls = require("null-ls")
        --   vim.list_extend(opts.sources, {
        --     nls.builtins.formatting.nixpkgs_fmt,
        --   })
        -- end,
    },
}
