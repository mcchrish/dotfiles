return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		opts = {
			-- icons = false,
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
			"yioneko/nvim-vtsls",
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

			local lspconfig = require "lspconfig"
			require("mason-lspconfig").setup {
				ensure_installed = { "eslint", "lua_ls", "emmet_language_server", "vale_ls" },
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			lspconfig.vtsls.setup {
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				capabilities = capabilities,
				settings = {
					vtsls = { tsserver = { globalPlugins = {} } },
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
				before_init = function(params, config)
					local result = vim.system(
						{ "npm", "query", "#vue" },
						{ cwd = params.workspaceFolders[1].name, text = true }
					)
						:wait()
					if result.stdout ~= "[]" then
						table.insert(config.settings.vtsls.tsserver.globalPlugins, {
							name = "@vue/typescript-plugin",
							location = require("mason-registry").get_package("vue-language-server"):get_install_path()
								.. "/node_modules/@vue/language-server",
							languages = { "vue" },
							configNamespace = "typescript",
							enableForWorkspaceTypeScriptVersions = true,
						})
					end
				end,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}

			lspconfig.volar.setup {
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					vim.keymap.set("n", "<leader>gr", function()
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
					end, { buffer = bufnr, desc = "Vue file references" })
				end,
			}

			lspconfig.eslint.setup { root_dir = lspconfig.util.root_pattern "package.json" }

			lspconfig.tailwindcss.setup { capabilities = capabilities }

			lspconfig.emmet_language_server.setup {
				on_attach = function(client, bufnr)
					vim.keymap.set("i", "<c-s>,", function()
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
					end, { noremap = true, buffer = bufnr, desc = "Expand emmet" })
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

			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", {}),
				callback = function(event)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local fzf = require "fzf-lua"

					map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")
					map("grr", fzf.lsp_references, "[G]oto [R]eferences")
					map("gI", fzf.lsp_implementations, "[G]oto [I]mplementation")
					map("g<c-d>", fzf.lsp_typedefs, "Type [D]efinition")
					map("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>ws", fzf.lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("gca", fzf.lsp_code_actions, "[C]ode [A]ction")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
							end,
						})
					end

					if client and client.server_capabilities.inlayHintProvider then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
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
