return {
    {
        "MagicDuck/grug-far.nvim",
        cmd = { "GrugFar", "GrugFarWithin" },
        keys = {
            {
                "<leader>rr",
                function()
                    require("grug-far").open({ visualSelectionUsage = "auto-detect" })
                end,
                mode = { "n", "x" },
                desc = "Search and replace",
            },
        },
        opts = {},
    },
}
