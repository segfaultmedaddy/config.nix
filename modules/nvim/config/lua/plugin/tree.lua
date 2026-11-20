local M = {}

function M.setup()
    -- nvim-tree loads icons through nvim-web-devicons.
    require("mini.icons").mock_nvim_web_devicons()

    require("nvim-tree").setup({
        -- Leave directory buffers to mini.files.
        hijack_netrw = false,
        hijack_directories = { enable = false },
        sync_root_with_cwd = true,
        update_focused_file = { enable = true },
        view = { width = 35 },
        renderer = { group_empty = true },
        filters = { git_ignored = false },
    })

    vim.keymap.set("n", "<D-b>", function()
        require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
    end, { desc = "Toggle file tree" })
end

return M
