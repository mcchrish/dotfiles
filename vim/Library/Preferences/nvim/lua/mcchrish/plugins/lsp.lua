return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
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
			"pmizio/typescript-tools.nvim",
			"nvim-lua/plenary.nvim",
		},
		init = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					update_in_insert = false,
				})
		end,
		config = function()
			local wk = require "which-key"
			local lspconfig = require "lspconfig"
			require("mason-lspconfig").setup {
				ensure_installed = { "eslint", "lua_ls", "emmet_language_server", "vale_ls" },
			}
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("typescript-tools").setup {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}

			lspconfig.eslint.setup {
				root_dir = lspconfig.util.root_pattern "package.json",
			}

			lspconfig.tailwindcss.setup {}

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

			local runtime_path = vim.split(package.path, ";")
			table.insert(runtime_path, "lua/?.lua")
			table.insert(runtime_path, "lua/?/init.lua")
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							-- Setup your lua path
							path = runtime_path,
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			}

			lspconfig.vale_ls.setup {}

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
							D = { vim.lsp.buf.declaration, "Declaration" },
							d = { vim.lsp.buf.definition, "Definition" },
							i = { vim.lsp.buf.implementation, "Implementation" },
							r = { require("fzf-lua").lsp_references, "References" },
							["<c-d>"] = { require("fzf-lua").lsp_typedefs, "Type definition" },
						},
						K = { vim.lsp.buf.hover, "Hover" },
						-- @todo must think another key as it conflicts with window nav
						-- ["<c-k>"] = { vim.lsp.buf.signature_help },
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
						["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
					}, { noremap = true, buffer = ev.buf })
				end,
			})

			-- signs
			local signs = { Error = "🮇", Warn = "▪", Hint = "▪", Info = "⋅" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl })
			end
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable_in_insert = false,
				virtual_text = false,
			},
		},
	},
}
