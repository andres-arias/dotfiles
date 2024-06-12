return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"pyright",
						"ruff_lsp",
						"lua_ls",
						"intelephense",
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lsp = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lsp.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			})
			lsp.ruff_lsp.setup({
				capabilities = capabilities,
			})
			lsp.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						autoImportCompletion = true,
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "off",
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})
			lsp.intelephense.setup({
				capabilities = capabilities,
				root_dir = lsp.util.root_pattern("composer.json", ".git", "*.php"),
				settings = {
					intelephense = {
						environment = {
							includePaths = {
								"C:/TestAutomation/Main/Aphrodite",
							},
							phpVersion = "7.1.8",
						},
						files = {
							maxSize = 1000000,
						},
					},
				},
			})
			lsp.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>M", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Open diagnostics window" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "View Symbol Information" })
					vim.keymap.set(
						"n",
						"<leader>gi",
						vim.lsp.buf.implementation,
						{ buffer = ev.buf, desc = "List all implementations" }
					)
					vim.keymap.set(
						"n",
						"<leader>gr",
						vim.lsp.buf.references,
						{ buffer = ev.buf, desc = "List all references to the symbol" }
					)
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol" })
					vim.keymap.set(
						"n",
						"<F4>",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "List code actions" }
					)
					vim.keymap.set(
						"n",
						"<leader>K",
						vim.lsp.buf.signature_help,
						{ buffer = ev.buf, desc = "Show signature help" }
					)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.type_definition,
						{ buffer = ev.buf, desc = "Go to type definition" }
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						vim.lsp.buf.declaration,
						{ buffer = ev.buf, desc = "Go to declaration" }
					)
				end,
			})
		end,
	},
}
