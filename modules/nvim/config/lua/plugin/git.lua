return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
            { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open LazyGit for current file" },
        },
    },
    { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "^" },
                changedelete = { text = "~" },
                untracked = { text = "?" },
            },
            numhl = true,
            linehl = true,
        },
        keys = {
            {
                "<leader>gB",
                function()
                    require("gitsigns").blame_line({ full = true })
                end,
                desc = "Blame current line",
            },
            {
                "<leader>gd",
                function()
                    require("gitsigns").diffthis()
                end,
                desc = "Diff current file",
            },
        },
    },
}
