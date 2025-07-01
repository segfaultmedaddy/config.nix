return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "css" })
            end
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tailwindcss = {
                    filetypes = {
                        "css",
                        "templ",
                        "astro",
                        "javascript",
                        "typescript",
                        "html",
                        "vue",
                        "svelte",
                    },

                    init_options = { userLanguages = { templ = "html" } },
                },
            },
        },
    },
}
