-- Set <space> as leader key.
-- Important: This must be set before any plugins are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")

-- Add filetypes.
vim.filetype.add({ extension = { templ = "templ" } })

-- Load plugins.
require("plugin")

-- Highlight on copy (yank).
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
})

require("config.keymaps")
