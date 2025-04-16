return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TSC" },
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
		opts = {},
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "eslint", "lua_ls", "emmet_language_server", "vale_ls" },
				automatic_installation = false,
			}

			vim.lsp.enable "vtsls"
			vim.lsp.config("vtsls", {
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
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
			})

			vim.lsp.enable "volar"
			vim.lsp.enable "eslint"
			vim.lsp.enable "tailwindcss"
			vim.lsp.enable "vale_ls"
			vim.lsp.enable "emmet_language_server"
			vim.lsp.config("emmet_language_server", {
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
			})

			vim.lsp.enable "lua_ls"
			vim.lsp.config("lua_ls", {
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
			})

			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", {}),
				callback = function(event)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local map = function(keys, func, desc, mode)
						vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local Snacks = require "snacks"

					map("gd", Snacks.picker.lsp_definitions, "[G]oto [D]efinition")
					map("g<c-d>", Snacks.picker.lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", Snacks.picker.lsp_symbols, "[D]ocument [S]ymbols")
					map("<leader>ws", Snacks.picker.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
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
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
		end,
	},
}
