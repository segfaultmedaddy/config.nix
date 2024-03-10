return {
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(opts)
      require("sg").setup(opts)
    end,
  },
}
