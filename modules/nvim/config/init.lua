-- Set <space> as leader key.
-- Important: This must be set before any plugins are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.lsp.set_log_level("info")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugin" },
    { import = "plugin.lang" },
  },

  -- defaults = { lazy = true },

  performance = {
    cache = {
      enabled = true,
    },
  },

  -- Automatically check for package updates.
  checker = {
    enabled = true,
    notify = false,
  },
})

-- Highlight on copy (yank).
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

require("config.options")
require("config.keymaps")
