local M = {}

function M.setup()
    require("mini.git").setup()
    require("mini.diff").setup({
        view = {
            style = "sign",
            signs = {
                add = "+",
                change = "~",
                delete = "_",
            },
        },
    })

    vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
    vim.keymap.set("n", "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", {
        desc = "Open LazyGit for current file",
    })
    vim.keymap.set("n", "<leader>gB", function()
        require("mini.git").show_at_cursor()
    end, { desc = "Show Git history at cursor" })
    vim.keymap.set("n", "<leader>gd", function()
        local diff = require("mini.diff")
        if diff.get_buf_data() then
            diff.toggle_overlay()
        else
            vim.notify("No diff available for this buffer", vim.log.levels.INFO)
        end
    end, { desc = "Toggle current file diff" })
end

return M
