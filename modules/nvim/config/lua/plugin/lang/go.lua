return {
  -- Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go" })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    -- @param opts lspconfig.options
    opts = {
      servers = {
        gopls = {},
      },
    },
  },

  -- Formatters
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.golines,
        nls.builtins.formatting.goimports,
        nls.builtins.diagnostics.golangci_lint,
      })
    end,
  },
}
