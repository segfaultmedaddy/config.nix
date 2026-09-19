local M = {}

function M.setup(parser_names)
    local treesitter = require("nvim-treesitter")
    treesitter.setup()

    local parsers = {}
    for _, parser in ipairs(parser_names) do
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

    require("treesitter-context").setup({ enable = true })
end

return M
