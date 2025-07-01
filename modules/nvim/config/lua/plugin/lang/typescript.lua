return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",

        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
            end
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { "jose-elias-alvarez/typescript.nvim" },

        -- @param opts lspconfig.options
        opts = {
            servers = {
                ts_ls = {},
            },

            setup = {
                tsserver = function(_, server_options)
                    require("typescript").setup({ server = server_options })
                    return true
                end,
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                eslint = {
                    settings = {
                        workingDirectory = { mode = "auto" },
                        codeActionOnSave = { enable = true },
                        format = true,
                    },
                },
            },

            setup = {
                eslint = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function(event)
                            if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
                                vim.cmd("EslintFixAll")
                            end
                        end,
                    })
                end,
            },
        },
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                prettier = {
                    ft_parsers = {
                        astro = "astro",
                    },
                },
            },
            formatters_by_ft = {
                astro = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
        },
    },
}
