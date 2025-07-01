return {
    -- Formatters
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                sql = { "prettier" },
            },
        },
    },
}
