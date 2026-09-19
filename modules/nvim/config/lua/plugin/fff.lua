local M = {}

function M.setup()
    local fff = require("fff")
    fff.setup()

    vim.keymap.set("n", "<leader>bp", function()
        local path = vim.api.nvim_buf_get_name(0)
        fff.find_files_in_dir(path == "" and vim.fn.getcwd() or vim.fs.dirname(path))
    end, { desc = "Find files in current directory" })
    vim.keymap.set("n", "<leader>ff", fff.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", fff.live_grep, { desc = "Live grep" })
    vim.keymap.set({ "n", "x" }, "<leader>fw", fff.live_grep_under_cursor, { desc = "Grep word or selection" })
end

return M
