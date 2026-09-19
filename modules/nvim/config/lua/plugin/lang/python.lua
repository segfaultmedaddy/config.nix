return {
    treesitter = { "python" },
    servers = {
        ruff = {},
    },
    formatters_by_ft = {
        python = { "ruff_format" },
    },
}
