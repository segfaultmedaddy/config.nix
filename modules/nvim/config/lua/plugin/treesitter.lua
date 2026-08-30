return {
    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter",
        dir = vim.fn.stdpath("data") .. "/site/pack/hm/start/nvim-treesitter",
        build = false,
        lazy = false,

        -- @type TSConfig
        opts = {
            ensure_installed = {},
        },

        config = function(_, opts)
            local treesitter = require("nvim-treesitter")
            treesitter.setup()

            -- Parsers are installed declaratively by Nix; this list controls activation.
            local parsers = {}
            for _, parser in ipairs(opts.ensure_installed) do
                parsers[parser] = true
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
                callback = function(event)
                    local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                    if language and parsers[language] and pcall(vim.treesitter.start, event.buf, language) then
                        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },

    -- Sticky header for scope context.
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
        },
    },
}
