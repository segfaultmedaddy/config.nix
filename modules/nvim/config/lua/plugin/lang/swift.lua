return {
    treesitter = { "swift" },
    servers = {
        sourcekit = vim.fn.executable("sourcekit-lsp") == 1 and {} or false,
    },
    formatters_by_ft = {
        swift = { "swift_format" },
    },
    linters_by_ft = {
        swift = { "swiftlint" },
    },
    setup = function()
        if vim.fn.has("macunix") ~= 1 then
            return
        end

        require("xcodebuild").setup({
            integrations = {
                pymobiledevice = { enabled = false },
                fzf_lua = { enabled = true },
                snacks_nvim = { enabled = false },
                telescope_nvim = { enabled = false },
            },
        })
        vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild actions" })
    end,
}
