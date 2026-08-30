return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme dayfox]])
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opts = {} },
        },

        opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
            },
        },
    },

    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },

    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
