return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "lua" })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            -- lua LSP and some extra goodies
            {
                "folke/neodev.nvim",
                config = true,
            },
        },

        -- @param opts lspconfig.options
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            },
        },
    },

    -- Formatters
    {
        "nvimtools/none-ls.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "williamboman/mason.nvim",
        },
        opts = function(_, opts)
            local nls = require("null-ls")
            vim.list_extend(opts.sources, {
                nls.builtins.formatting.stylua,
            })
        end,
    },
}
