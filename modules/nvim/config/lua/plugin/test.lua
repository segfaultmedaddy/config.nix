return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust",
        },
        keys = {
            {
                "<leader>tt",
                function()
                    require("neotest").run.run()
                end,
                desc = "Run nearest test",
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run test file",
            },
            {
                "<leader>tl",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Run last test",
            },
            {
                "<leader>ts",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "Toggle test summary",
            },
            {
                "<leader>to",
                function()
                    require("neotest").output.open({ enter = true })
                end,
                desc = "Show test output",
            },
            {
                "<leader>tx",
                function()
                    require("neotest").run.stop()
                end,
                desc = "Stop test",
            },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-golang")({ runner = "go" }),
                    require("neotest-jest")({}),
                    require("neotest-python")({}),
                    require("neotest-rust"),
                    require("neotest-vitest"),
                },
                output = {
                    open_on_run = true,
                },
                status = {
                    virtual_text = true,
                },
            })
        end,
    },
}
