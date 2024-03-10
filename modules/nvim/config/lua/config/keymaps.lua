local util = require("util")
local map = util.map

map({ "i", "v" }, "<C-c>", "<Esc>", { desc = "Escape to normal mode" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "n" }, "<leader>q", "<cmd>q<CR>", { desc = "Close current split" })

-- Editor
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><Esc>", {
  desc = "Save file",
})
map("n", "<leader>nf", "<cmd>enew<cr>", {
  desc = "New File",
})
map({ "n" }, "<leader>p", "+p") -- Paste from system clipboard
map({ "v" }, "<leader>y", '"+y') -- Copy to system clipboard

map("v", "<S-Tab>", "<gv", { desc = "Dedent selected block" })
map("v", "<Tab>", ">gv", { desc = "Indent selected block" })
map("n", "<Tab>", ">>", { desc = "Indent current line" })
map("n", "<S-Tab>", "<<", { desc = "Dedent current line" })

-- Buffer
map({ "v", "n" }, "<leader>bq", "<cmd>bd<cr>", { desc = "Delete buffer" })
map({ "v", "n" }, "<leader>b]", "<cmd>bn<cr>", { desc = "Next buffer" })
map({ "v", "n" }, "<leader>b[", "<cmd>bp<cr>", { desc = "Previous buffer" })

-- LSP
map(
  { "n", "v" },
  "gd",
  "<cmd>Telescope lsp_definitions<CR>",
  { desc = "Goto definition" }
)
map(
  { "n", "v" },
  "<leader>rn",
  "<cmd>lua vim.lsp.buf.rename()<CR>",
  { desc = "Rename definition" }
)
map(
  { "n", "v" },
  "<leader>ca",
  "<cmd>lua vim.lsp.buf.code_action()<CR>",
  { desc = "Code actions" }
)
map(
  { "n", "v" },
  "<leader>f",
  "<cmd>lua vim.lsp.buf.format()<CR>",
  { desc = "Format file" }
)
map(
  { "n", "v" },
  "<leader>h",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { desc = "Hover" }
)
map(
  { "n", "v" },
  "<leader>hd",
  "<cmd>lua vim.diagnostic.open_float()<CR>",
  { desc = "Show diagnostics" }
)

-- Code navigation
map(
  { "n", "v" },
  "[",
  "<C-o>",
  { desc = "Move cursor to the previous location" }
)
map({ "n", "v" }, "]", "<C-i>", { desc = "Move cursor to the next location" })
map(
  { "n", "v" },
  "<leader>e[",
  "g;",
  { desc = "Move cursor to previous change location" }
)
map(
  { "n", "v" },
  "<leader>e]",
  "g,",
  { desc = "Move cursor to next change location" }
)
map({ "n", "v" }, "<leader>el", "gi", {
  desc = "Move cursor to the last position where cursor was in the insert mode",
})
-- Window management
map(
  { "n", "v" },
  "<leader>wv",
  "<C-w>v",
  { desc = "Split window horizontally" }
)
map({ "n", "v" }, "<leader>wh", "<C-w>s", { desc = "Split window vertically" })
map({ "n", "v" }, "<leader>w", "<C-w>", { desc = "Move window" })
