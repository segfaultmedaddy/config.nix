local M = {
    treesitter = {},
    servers = {},
    formatters = {},
    formatters_by_ft = {},
    linters_by_ft = {},
}

local setups = {}
local languages = {
    "terraform",
    "dart",
    "svelte",
    "css",
    "typescript",
    "swift",
    "go",
    "rust",
    "sql",
    "nix",
    "templ",
    "python",
    "lua",
}

for _, language in ipairs(languages) do
    local config = require("plugin.lang." .. language)
    vim.list_extend(M.treesitter, config.treesitter or {})

    for _, key in ipairs({ "servers", "formatters", "formatters_by_ft", "linters_by_ft" }) do
        M[key] = vim.tbl_deep_extend("force", M[key], config[key] or {})
    end

    if config.setup then
        table.insert(setups, config.setup)
    end
end

function M.setup()
    for _, setup in ipairs(setups) do
        setup()
    end
end

return M
