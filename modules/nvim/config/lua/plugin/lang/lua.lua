return {
    treesitter = { "lua" },
    servers = {
        lua_ls = {
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        },
    },
    formatters_by_ft = {
        lua = { "stylua" },
    },
    setup = function()
        require("lazydev").setup()
    end,
}
