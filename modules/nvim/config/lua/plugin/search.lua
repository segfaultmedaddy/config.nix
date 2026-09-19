local M = {}

function M.setup()
    local grug_far = require("grug-far")
    grug_far.setup()
    vim.keymap.set({ "n", "x" }, "<leader>rr", function()
        grug_far.open({ visualSelectionUsage = "auto-detect" })
    end, { desc = "Search and replace" })
end

return M
