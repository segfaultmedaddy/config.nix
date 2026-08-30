return {
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        init = function()
            vim.g.nvim_surround_no_normal_mappings = true
        end,
        config = function()
            require("nvim-surround").setup()
            vim.keymap.set("n", "<leader>s", "<Plug>(nvim-surround-normal)", {
                desc = "Add a surrounding pair around a motion",
            })
            vim.keymap.set("n", "<leader>ss", "<Plug>(nvim-surround-normal-cur)", {
                desc = "Add a surrounding pair around the current line",
            })
            vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal-line)", {
                desc = "Add a surrounding pair around a motion on new lines",
            })
            vim.keymap.set("n", "ySS", "<Plug>(nvim-surround-normal-cur-line)", {
                desc = "Add a surrounding pair around the current line on new lines",
            })
            vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
                desc = "Delete a surrounding pair",
            })
            vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
                desc = "Change a surrounding pair",
            })
            vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change-line)", {
                desc = "Change a surrounding pair on new lines",
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            enable_check_bracket_line = true,
        },
    },
    {
        "nvim-mini/mini.ai",
        main = "mini.ai",
        event = "VeryLazy",
        opts = {
            n_lines = 500,
        },
    },
}
