return {
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                theme = "immortal",
            })
            require("black-metal").load()
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
