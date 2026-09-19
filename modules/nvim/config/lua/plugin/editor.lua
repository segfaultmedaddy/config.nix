local M = {}

function M.setup()
    require("catppuccin").setup({
        flavour = "mocha",
        auto_integrations = true,
    })
    vim.cmd.colorscheme("catppuccin-mocha")

    require("mini.icons").setup()
    require("mini.input").setup()
    require("mini.pick").setup()
    require("mini.notify").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()

    local miniclue = require("mini.clue")
    miniclue.setup({
        triggers = {
            { mode = { "n", "x" }, keys = "<Leader>" },
            { mode = "n", keys = "[" },
            { mode = "n", keys = "]" },
            { mode = "i", keys = "<C-x>" },
            { mode = { "n", "x" }, keys = "g" },
            { mode = { "n", "x" }, keys = "'" },
            { mode = { "n", "x" }, keys = "`" },
            { mode = { "n", "x" }, keys = '"' },
            { mode = { "i", "c" }, keys = "<C-r>" },
            { mode = "n", keys = "<C-w>" },
            { mode = { "n", "x" }, keys = "z" },
        },
        clues = {
            miniclue.gen_clues.square_brackets(),
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
        },
    })

    require("ibl").setup()
    require("ts-comments").setup()
    require("mini.files").setup({
        options = {
            use_as_default_explorer = true,
        },
    })

    local open_files = function()
        if MiniFiles.close() then
            return
        end

        local path = vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) or nil
        MiniFiles.open(path ~= "" and path or nil)
    end

    vim.keymap.set("n", "<leader>e", open_files, { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>nf", open_files, { desc = "Create file with Mini Files" })
end

return M
