return {
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "swift" })
        end,
    },

    {
        "neovim/nvim-lspconfig",

        -- @param opts lspconfig.options
        opts = {
            servers = {
                sourcekit = vim.fn.executable("sourcekit-lsp") == 1 and {} or false,
            },
        },
    },

    {
        "wojciech-kulik/xcodebuild.nvim",
        cond = vim.fn.has("macunix") == 1,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "ibhagwan/fzf-lua",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            integrations = {
                pymobiledevice = { enabled = false },
                fzf_lua = { enabled = true },
                snacks_nvim = { enabled = false },
                telescope_nvim = { enabled = false },
            },
        },
        keys = {
            { "<leader>X", "<cmd>XcodebuildPicker<cr>", desc = "Show Xcodebuild actions" },
        },
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                swift = { "swift_format" },
            },
        },
    },

    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                swift = { "swiftlint" },
            },
        },
    },
}
