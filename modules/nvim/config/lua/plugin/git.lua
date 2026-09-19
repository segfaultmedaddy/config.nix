local M = {}

function M.setup()
    require("gitsigns").setup({
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "^" },
            changedelete = { text = "~" },
            untracked = { text = "?" },
        },
        numhl = true,
        linehl = true,
    })

    vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
    vim.keymap.set("n", "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", {
        desc = "Open LazyGit for current file",
    })
    vim.keymap.set("n", "<leader>gB", function()
        require("gitsigns").blame_line({ full = true })
    end, { desc = "Blame current line" })
    vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { desc = "Diff current file" })
end

return M
