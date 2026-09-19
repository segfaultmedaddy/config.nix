local M = {}

function M.setup()
    require("blink.cmp").setup({
        keymap = {
            preset = "enter",
            ["<C-d>"] = { "scroll_documentation_up", "fallback" },
            ["<C-u>"] = { "scroll_documentation_down", "fallback" },
        },
        completion = {
            menu = {
                border = "rounded",
            },
            documentation = {
                window = {
                    border = "rounded",
                },
            },
        },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
    })
end

return M
