local M = {}

M.map = function(modes, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    if type(modes) == "string" then
        modes = { modes }
    end

    for _, mode in ipairs(modes) do
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

M.on_attach = function(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

return M
