local M = {}

function M.setup()
    vim.cmd.colorscheme("carbonfox")

    require("nvim-web-devicons").setup()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "auto",
        },
    })
    require("fidget").setup()
    require("bufferline").setup()
    require("ibl").setup()
    require("which-key").setup()
    require("ts-comments").setup()
    require("oil").setup({
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
        },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })
    vim.keymap.set("n", "<leader>nf", "<cmd>Oil<cr>", { desc = "Create file with Oil" })
end

return M
