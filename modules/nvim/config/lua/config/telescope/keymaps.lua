if not pcall(require, "telescope") then
    return
end

local util = require("util")
local map = util.map

map("n", "<leader>bp", ":Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>b", ":Telescope buffers sort_mru=true ignore_current_buffer=true<CR>", { noremap = true })
map("n", "<leader>gf", ":Telescope git_files<CR>", { noremap = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>fr", ":Telescope lsp_references<CR>", { noremap = true })
map("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true })
map("n", "<leader>fs", ":Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true })
map("n", "<leader>ffs", ":Telescope lsp_document_symbols<CR>", { noremap = true })
