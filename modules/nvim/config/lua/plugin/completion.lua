return {
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "neovim/nvim-lspconfig",

            "hrsh7th/cmp-nvim-lsp", -- lsp suggestions
            "hrsh7th/cmp-buffer",   -- current file suggestions
            "hrsh7th/cmp-path",     -- fs suggestions
            "hrsh7th/cmp-nvim-lua", -- neovim's lua API suggestions

            -- Snippets.
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        event = "InsertEnter",

        opts = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
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
                    ["<C-a>"] = cmp.mapping.complete({
                        config = { sources = { name = "cody" } },
                    }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "cody" },
                    { name = "buffer" },
                    { name = "path" },
                }),

                experimental = {
                    native_menu = false,
                    ghost_text = false,
                },
            })
        end,
    },
}
