-- Set the terminal title to "<parent>/<parent>/<file> — <project>".
-- Special buffers (file tree, pickers, floating windows) keep the last file's title.
vim.opt.title = true
vim.opt.titlelen = 0

local function escape(text)
    return (text:gsub("%%", "%%%%"))
end

-- Path relative to the project, shortened to the file and its two parent folders.
local function short_path(name)
    local parts = vim.split(vim.fn.fnamemodify(name, ":~:."), "/", { plain = true })
    if #parts <= 3 then
        return table.concat(parts, "/")
    end
    return "…/" .. table.concat(parts, "/", #parts - 2)
end

local function update_title()
    local project = escape(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local is_file = name ~= ""
        and vim.bo[buf].buftype == ""
        and vim.bo[buf].buflisted
        and vim.api.nvim_win_get_config(0).relative == ""

    if is_file then
        local modified = vim.bo[buf].modified and " ●" or ""
        vim.o.titlestring = escape(short_path(name)) .. modified .. " — " .. project
    elseif vim.o.titlestring == "" then
        vim.o.titlestring = "nvim — " .. project
    end
end

local group = vim.api.nvim_create_augroup("terminal_title", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufFilePost", "BufWritePost", "DirChanged" }, {
    group = group,
    callback = update_title,
})
vim.api.nvim_create_autocmd("OptionSet", {
    group = group,
    pattern = "modified",
    callback = update_title,
})
