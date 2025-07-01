return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        -- Prefer master as latest version is outdated.
        version = false,

        event = { "BufReadPost", "BufNewFile" },

        -- @type TSConfig
        opts = {
            indent = { enable = true },

            ensure_installed = {},

            auto_install = true,

            highlight = {
                enable = true,

                -- Speedup highlighting
                additional_vim_regex_highlight = false,
            },
        },

        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- {
    --   "nvim-treesitter/nvim-treesitter-textobjects",
    --   opts = {
    --     textobjects = {
    --       select = {
    --         enable = true,
    --         lookahead = true,
    --       },
    --     },
    --   },
    -- },

    -- Sticky header for scope context.
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
        },
    },
}
