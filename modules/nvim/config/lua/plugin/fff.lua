return {
    {
        "dmtrKovalenko/fff",
        build = function()
            require("fff.download").download_or_build_binary()
        end,
        lazy = false,
        opts = {},
        keys = {
            {
                "<leader>bp",
                function()
                    local path = vim.api.nvim_buf_get_name(0)
                    require("fff").find_files_in_dir(path == "" and vim.fn.getcwd() or vim.fs.dirname(path))
                end,
                desc = "Find files in current directory",
            },
            {
                "<leader>ff",
                function()
                    require("fff").find_files()
                end,
                desc = "Find files",
            },
            {
                "<leader>fg",
                function()
                    require("fff").live_grep()
                end,
                desc = "Live grep",
            },
            {
                "<leader>fw",
                function()
                    require("fff").live_grep_under_cursor()
                end,
                mode = { "n", "x" },
                desc = "Grep word or selection",
            },
        },
    },
}
