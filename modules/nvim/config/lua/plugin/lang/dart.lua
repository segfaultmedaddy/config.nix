return {
	-- Better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",

		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "dart" })
		end,
	},

	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		setup = {
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					virtual_text = false,
				},
				settings = {
					renameFilesWithClasses = "always",
					updateImportsOnRename = true,
					completeFunctionCalls = true,
					lineLength = 80,
				},
			},
			widget_guides = { enabled = true },
		},
	},
}
