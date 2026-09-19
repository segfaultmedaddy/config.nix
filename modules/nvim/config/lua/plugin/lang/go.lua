return {
    treesitter = { "go" },
    servers = {
        gopls = {},
    },
    formatters_by_ft = {
        go = { "goimports", "golines" },
    },
    linters_by_ft = {
        go = { "golangcilint" },
    },
}
