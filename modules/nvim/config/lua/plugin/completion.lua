return {
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- lsp suggestions
            "hrsh7th/cmp-buffer", -- current file suggestions
            "hrsh7th/cmp-path", -- fs suggestions
            "hrsh7th/cmp-nvim-lua", -- neovim's lua API suggestions
        },

        event = "InsertEnter",

        opts = function()
            local cmp = require("cmp")

            return {
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = {
                        -- insert mode
                        i = cmp.mapping.complete(),
                        -- command-line mode
                        c = function(_fallback)
                            if cmp.visible() then
                                if not cmp.confirm({ select = true }) then
                                    return
                                else
                                    cmp.complete()
                                end
                            end
                        end,
                    },
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),

                experimental = {
                    native_menu = false,
                    ghost_text = false,
                },
            }
        end,
    },
}
