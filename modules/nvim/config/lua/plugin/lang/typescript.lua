return {
    treesitter = { "javascript", "typescript", "tsx" },
    servers = {
        ts_ls = {},
        eslint = {
            settings = {
                workingDirectory = { mode = "auto" },
                format = true,
            },
        },
    },
    formatters = {
        prettier = {
            ft_parsers = {
                astro = "astro",
            },
        },
    },
    formatters_by_ft = {
        astro = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
    },
}
