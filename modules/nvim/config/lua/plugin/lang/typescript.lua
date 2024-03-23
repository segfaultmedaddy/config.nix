return {
	-- Better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",

		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
			end
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "jose-elias-alvarez/typescript.nvim" },

		-- @param opts lspconfig.options
		opts = {
			servers = {
				tsserver = {},
			},

			setup = {
				tsserver = function(_, server_options)
					require("typescript").setup({ server = server_options })
					return true
				end,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				eslint = {
					settings = {
						workingDirectory = { mode = "auto" },
						codeActionOnSave = { enable = true },
						format = true,
					},
				},
			},

			setup = {
				eslint = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						callback = function(event)
							if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
								vim.cmd("EslintFixAll")
							end
						end,
					})
				end,
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
				require("typescript.extensions.null-ls.code-actions"),
				nls.builtins.formatting.prettier,
			})
		end,
	},
}
