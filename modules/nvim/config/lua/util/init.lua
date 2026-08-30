local M = {}

M.map = function(modes, lhs, rhs, opts)
    vim.keymap.set(modes, lhs, rhs, vim.tbl_extend("force", { noremap = true }, opts or {}))
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
