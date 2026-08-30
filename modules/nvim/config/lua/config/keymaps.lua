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
map({ "n" }, "<leader>p", '"+p') -- Paste from system clipboard
map({ "v" }, "<leader>y", '"+y') -- Copy to system clipboard

map("v", "<S-Tab>", "<gv", { desc = "Dedent selected block" })
map("v", "<Tab>", ">gv", { desc = "Indent selected block" })
map("n", "<Tab>", ">>", { desc = "Indent current line" })
map("n", "<S-Tab>", "<<", { desc = "Dedent current line" })

-- Buffer
map("n", "<leader>b", function()
    local buffers = vim.tbl_filter(function(bufnr)
        return vim.bo[bufnr].buflisted
    end, vim.api.nvim_list_bufs())

    vim.ui.select(buffers, {
        prompt = "Buffers",
        format_item = function(bufnr)
            local name = vim.api.nvim_buf_get_name(bufnr)
            return name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":~:.")
        end,
    }, function(bufnr)
        if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_set_current_buf(bufnr)
        end
    end)
end, { desc = "Select buffer" })
map({ "v", "n" }, "<leader>bq", "<cmd>bd<cr>", { desc = "Delete buffer" })
map({ "v", "n" }, "<leader>b]", "<cmd>bn<cr>", { desc = "Next buffer" })
map({ "v", "n" }, "<leader>b[", "<cmd>bp<cr>", { desc = "Previous buffer" })

-- LSP
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map({ "n", "v" }, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename definition" })
map({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
map({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })
map({ "n", "v" }, "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
map({ "n", "v" }, "<leader>hd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })
map("n", "]d", function()
    vim.diagnostic.jump({ count = vim.v.count1, float = true })
end, { desc = "Next diagnostic" })
map("n", "[d", function()
    vim.diagnostic.jump({ count = -vim.v.count1, float = true })
end, { desc = "Previous diagnostic" })
map("n", "]e", function()
    vim.diagnostic.jump({ count = vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Next error" })
map("n", "[e", function()
    vim.diagnostic.jump({ count = -vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Previous error" })
map("n", "<leader>fr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "<leader>fs", vim.lsp.buf.workspace_symbol, { desc = "Find workspace symbols" })
map("n", "<leader>ffs", vim.lsp.buf.document_symbol, { desc = "Find document symbols" })

-- Search
map("n", "<leader>fh", function()
    local tag = vim.fn.input("Help: ", "", "help")
    if tag ~= "" then
        vim.cmd.help(tag)
    end
end, { desc = "Find help" })
map("n", "<leader>gb", function()
    local branches = vim.fn.systemlist({ "git", "branch", "--format=%(refname:short)" })
    if vim.v.shell_error ~= 0 then
        vim.notify("Unable to list Git branches", vim.log.levels.ERROR)
        return
    end

    vim.ui.select(branches, { prompt = "Git branches" }, function(branch)
        if not branch then
            return
        end

        vim.system({ "git", "switch", branch }, { text = true }, function(result)
            vim.schedule(function()
                if result.code == 0 then
                    vim.cmd.checktime()
                else
                    vim.notify(vim.trim(result.stderr), vim.log.levels.ERROR)
                end
            end)
        end)
    end)
end, { desc = "Switch Git branch" })

-- Code navigation
map({ "n", "v" }, "<leader>e[", "g;", { desc = "Move cursor to previous change location" })
map({ "n", "v" }, "<leader>e]", "g,", { desc = "Move cursor to next change location" })
map({ "n", "v" }, "<leader>el", "gi", {
    desc = "Move cursor to the last position where cursor was in the insert mode",
})
-- Window management
map({ "n", "v" }, "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map({ "n", "v" }, "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map({ "n", "v" }, "<leader>w", "<C-w>", { desc = "Move window" })
