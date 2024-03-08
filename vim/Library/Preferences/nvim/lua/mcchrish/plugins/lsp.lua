return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"folke/trouble.nvim",
		keys = {
			{
				"<leader>xx",
				function()
					require("trouble").toggle()
				end,
				mode = { "n" },
				desc = "Trouble",
			},
			{
				"<leader>xw",
				function()
					require("trouble").toggle "workspace_diagnostics"
				end,
				mode = { "n" },
				desc = "Trouble workspace diagnostics",
			},
			{
				"<leader>xd",
				function()
					require("trouble").toggle "document_diagnostic"
				end,
				mode = { "n" },
				desc = "Trouble document diagnostics",
			},
			{
				"<leader>xq",
				function()
					require("trouble").toggle "quickfix"
				end,
				mode = { "n" },
				desc = "Trouble quickfix",
			},
			{
				"<leader>xl",
				function()
					require("trouble").toggle "loclist"
				end,
				mode = { "n" },
				desc = "Trouble location list",
			},
			{
				"gR",
				function()
					require("trouble").toggle "loclist"
				end,
				mode = { "n" },
				desc = "lsp_references",
			},
		},
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			icons = false,
			action_keys = {
				close = "gq",
				open_split = { "<c-s>" },
			},
			use_diagnostic_signs = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", opts = {} },
			"pmizio/typescript-tools.nvim",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			diagnostics = {
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
				},
				severity_sort = true,
			},
			signs = { Error = "🮇", Warn = "▪", Hint = "▪", Info = "⋅" },
		},
		config = function(_, opts)
			vim.diagnostic.config(opts.diagnostics)

			local wk = require "which-key"
			local lspconfig = require "lspconfig"
			require("mason-lspconfig").setup {
				ensure_installed = { "eslint", "lua_ls", "emmet_language_server", "vale_ls" },
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("typescript-tools").setup {
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}

			lspconfig.eslint.setup { root_dir = lspconfig.util.root_pattern "package.json" }

			lspconfig.tailwindcss.setup { capabilities = capabilities }

			lspconfig.volar.setup {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					wk.register({
						["<leader>gr"] = {
							function()
								client.request(
									"volar/client/findFileReference",
									{ textDocument = vim.lsp.util.make_text_document_params(bufnr) },
									function(_, locations, context)
										local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
										vim.fn.setqflist(
											{},
											" ",
											{ title = "Vue File References", items = items, context = context }
										)
										require("fzf-lua").quickfix()
										-- vim.api.nvim_command "copen"
									end,
									bufnr
								)
							end,
							"Vue file references",
						},
					}, { mode = "n", noremap = true, buffer = bufnr })
				end,
			}

			lspconfig.emmet_language_server.setup {
				on_attach = function(client, bufnr)
					wk.register({
						["<c-s>"] = {
							[","] = {
								function()
									client.request(
										"textDocument/completion",
										vim.lsp.util.make_position_params(0, client.offset_encoding),
										function(_, result)
											local textEdit = result.items[1].textEdit
											local snip_string = textEdit.newText
											textEdit.newText = ""
											vim.lsp.util.apply_text_edits({ textEdit }, bufnr, client.offset_encoding)
											require("luasnip").lsp_expand(snip_string)
										end,
										bufnr
									)
								end,
								"Expand emmet",
							},
						},
					}, { mode = "i", noremap = true, buffer = bufnr })
				end,
			}

			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}

			lspconfig.vale_ls.setup { capabilities = capabilities }

			wk.register({
				["<leader>"] = {
					e = {
						vim.diagnostic.open_float,
						"Line diagnostics",
					},
					q = { vim.diagnostic.setloclist, "Open diagnostics location list" },
				},
				["["] = {
					d = { vim.diagnostic.goto_prev, "Previous diagnostics" },
				},
				["]"] = {
					d = { vim.diagnostic.goto_next, "Next diagnostics" },
				},
			}, { noremap = true, silent = true })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					wk.register({
						g = {
							D = { require("fzf-lua").lsp_declarations, "Declaration" },
							d = { require("fzf-lua").lsp_definitions, "Definition" },
							i = { require("fzf-lua").lsp_implementations, "Implementation" },
							r = { require("fzf-lua").lsp_references, "References" },
							["<c-d>"] = { require("fzf-lua").lsp_typedefs, "Type definition" },
						},
						K = { vim.lsp.buf.hover, "Hover" },
						gK = { vim.lsp.buf.signature_help, "Signature Help" },
						["<leader>w"] = {
							name = "+LSP workspace",
							a = { vim.lsp.buf.add_workspace_folder, "add folder" },
							r = { vim.lsp.buf.remove_workspace_folder, "remove folder" },
							l = {
								function()
									print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
								end,
								"list folders",
							},
						},
						["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
						["<leader>ca"] = { require("fzf-lua").lsp_code_actions, "Code action" },
					}, { noremap = true, buffer = ev.buf })
				end,
			})

			-- signs
			for type, icon in pairs(opts.signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl })
			end
		end,
	},
}
