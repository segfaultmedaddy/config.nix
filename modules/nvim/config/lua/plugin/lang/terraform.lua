return {
	-- Better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",

		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "terraform" })
		end,
	},

	{
		"neovim/nvim-lspconfig",

		-- @param opts lspconfig.options
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},

	-- Formatters
	{
		"nvimtools/none-ls.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim", "williamboman/mason.nvim" },
		opts = function(_, opts)
			local nls = require("null-ls")
			vim.list_extend(opts.sources, {
				nls.builtins.formatting.terraform_fmt.with({
					command = "tofu",
				}),
				nls.builtins.diagnostics.terraform_validate.with({
					command = "tofu",
				}),
			})
		end,
	},
}
