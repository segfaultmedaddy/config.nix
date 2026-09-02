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

    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
        },
        keys = {
            { "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer" },
            { "<leader>nf", "<cmd>Oil<cr>", desc = "Create file with Oil" },
        },
    },
}
