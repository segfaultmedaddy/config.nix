return {
    treesitter = { "css" },
    servers = {
        cssls = {},
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
}
