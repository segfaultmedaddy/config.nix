return {
    treesitter = { "rust" },
    servers = {
        rust_analyzer = {},
    },
    formatters_by_ft = {
        rust = { "rustfmt" },
    },
    setup = function()
        require("crates").setup()
    end,
}
