local M = {}

function M.setup()
    require("mini.surround").setup({
        mappings = {
            add = "<leader>s",
            delete = "ds",
            find = "",
            find_left = "",
            highlight = "",
            replace = "cs",
            suffix_last = "",
            suffix_next = "",
        },
        respect_selection_type = true,
        search_method = "cover_or_next",
    })

    vim.keymap.set("n", "<leader>ss", "<leader>s_", {
        desc = "Add a surrounding pair around the current line",
        remap = true,
    })
    vim.keymap.set("n", "yS", "<leader>s", {
        desc = "Add a surrounding pair around a motion",
        remap = true,
    })
    vim.keymap.set("n", "ySS", "<leader>s_", {
        desc = "Add a surrounding pair around the current line on new lines",
        remap = true,
    })
    vim.keymap.set("n", "cS", "cs", {
        desc = "Change a surrounding pair",
        remap = true,
    })

    require("mini.pairs").setup()
    require("mini.ai").setup({
        n_lines = 500,
    })
end

return M
