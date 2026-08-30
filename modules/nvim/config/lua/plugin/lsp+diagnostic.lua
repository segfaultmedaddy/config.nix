local util = require("util")
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },

        opts = {
            servers = {},
        },

        init = function()
            vim.diagnostic.config({
                severity_sort = true,
                update_in_insert = false,
                underline = true,
                signs = true,
                virtual_text = {
                    spacing = 2,
                    source = "if_many",
                },
                float = {
                    border = "rounded",
                    source = "if_many",
                },
            })
        end,

        config = function(_, opts)
            util.on_attach(function(client, bufnr)
                if client.name == "eslint" then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("eslint_fix_" .. bufnr, { clear = true }),
                        buffer = bufnr,
                        command = "LspEslintFixAll",
                    })
                end
            end)

            local servers = opts.servers
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    vim.lsp.config(
                        server,
                        vim.tbl_deep_extend("force", {
                            capabilities = capabilities,
                        }, server_opts)
                    )

                    vim.lsp.enable(server)
                end
            end
        end,
    },

    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 1000,
            },
        },
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            linters_by_ft = {},
        },
        config = function(_, opts)
            local lint = require("lint")
            local pending = {}
            lint.linters_by_ft = opts.linters_by_ft
            vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
                group = vim.api.nvim_create_augroup("lint", { clear = true }),
                callback = function(event)
                    pending[event.buf] = (pending[event.buf] or 0) + 1
                    local generation = pending[event.buf]

                    vim.defer_fn(function()
                        if pending[event.buf] ~= generation then
                            return
                        end

                        pending[event.buf] = nil
                        if not vim.api.nvim_buf_is_valid(event.buf) or not vim.api.nvim_buf_is_loaded(event.buf) then
                            return
                        end

                        vim.api.nvim_buf_call(event.buf, function()
                            lint.try_lint()
                        end)
                    end, 100)
                end,
            })
        end,
    },
}
