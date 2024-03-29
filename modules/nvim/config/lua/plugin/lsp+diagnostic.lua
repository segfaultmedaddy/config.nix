local util = require("util")
return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",

		dependencies = {
			-- LSP auto installer
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			"hrsh7th/cmp-nvim-lsp", -- lsp suggestion
		},

		opts = {
			servers = {},
			setup = {},
		},

		config = function(_, opts)
			-- Show diagnostics on hover.
			util.on_attach(function(_, bufnr)
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = bufnr,
					callback = function()
						local diagnostic_opts = {
							focusable = false,
							close_events = {
								"BufLeave",
								"CursorMoved",
								"InsertEnter",
								"FocusLost",
							},
							border = "rounded",
							source = "always",
							prefix = " ",
							scope = "cursor",
						}
						vim.diagnostic.open_float(nil, diagnostic_opts)
					end,
				})
			end)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = servers[server] or {}
				server_opts.capabilities = capabilities

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					if not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			mlsp.setup({
				ensure_installed = ensure_installed,
			})
			mlsp.setup_handlers({ setup })
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = "Mason",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
			},
		},

		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")

			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end

			if mr.refresh() then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	-- Formatters.
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"williamboman/mason.nvim",
		},
		opts = function()
			local nls = require("null-ls")

			return {
				debug = true,
				sources = {
					nls.builtins.code_actions.refactoring,
					nls.builtins.completion.luasnip,
				},
				on_attach = function(client, bufnr)
					-- Automatically run formatter on save.
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting" .. bufnr, {}),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			}
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
		},
	},
}
