local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local data = event.data
        if data.spec.name ~= "fff" or (data.kind ~= "install" and data.kind ~= "update") then
            return
        end

        if not data.active then
            vim.cmd.packadd("fff")
        end
        require("fff.download").download_or_build_binary()
    end,
})

local plugins = {
    {
        src = gh("catppuccin/nvim"),
        name = "catppuccin",
    },
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-neotest/nvim-nio"),
    gh("antoinemadec/FixCursorHold.nvim"),
    gh("mfussenegger/nvim-dap"),
    {
        src = gh("saghen/blink.cmp"),
        version = vim.version.range("1.*"),
    },
    gh("nvim-mini/mini.nvim"),
    gh("nvim-treesitter/nvim-treesitter-context"),
    gh("dmtrKovalenko/fff"),
    gh("neovim/nvim-lspconfig"),
    gh("stevearc/conform.nvim"),
    gh("mfussenegger/nvim-lint"),
    gh("fredrikaverpil/neotest-golang"),
    gh("marilari88/neotest-vitest"),
    gh("nvim-neotest/neotest-jest"),
    gh("nvim-neotest/neotest-python"),
    gh("rouge8/neotest-rust"),
    gh("nvim-neotest/neotest"),
    gh("MagicDuck/grug-far.nvim"),
    gh("lukas-reineke/indent-blankline.nvim"),
    gh("folke/ts-comments.nvim"),
    gh("kdheepak/lazygit.nvim"),
    gh("sindrets/diffview.nvim"),
    gh("nvim-flutter/flutter-tools.nvim"),
    gh("Saecki/crates.nvim"),
    gh("folke/lazydev.nvim"),
}

if vim.fn.has("macunix") == 1 then
    vim.list_extend(plugins, {
        gh("MunifTanjim/nui.nvim"),
        gh("ibhagwan/fzf-lua"),
        gh("wojciech-kulik/xcodebuild.nvim"),
    })
end

vim.pack.add(plugins, { confirm = false, load = true })

-- Treesitter and its parsers are installed declaratively by Nix.
vim.cmd.packadd("nvim-treesitter")

local lang = require("plugin.lang")

require("plugin.editor").setup()
require("plugin.completion").setup()
require("plugin.treesitter").setup(lang.treesitter)
lang.setup()
require("plugin.lsp+diagnostic").setup(lang)
require("plugin.surround").setup()
require("plugin.fff").setup()
require("plugin.test").setup()
require("plugin.search").setup()
require("plugin.git").setup()
