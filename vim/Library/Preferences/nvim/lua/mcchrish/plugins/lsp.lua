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
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			icons = false,
			action_keys = {
				close = "gq",
				open_split = { "<c-s>" },
			},
			use_diagnostic_signs = true,
		},
		config = function(_, opts)
			require("trouble").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
			"yioneko/nvim-vtsls",
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

			local function on_attach(_client, bufnr, _opts)

				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

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
				}, { noremap = true, buffer = bufnr })
			end

			local lspconfig = require "lspconfig"
			require("mason-lspconfig").setup {
				ensure_installed = { "eslint", "lua_ls", "tsserver", "vtsls", "emmet_language_server" },
			}
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			local default_opts = {
				on_attach = on_attach,
			}

			-- require("typescript").setup {
			-- 	server = vim.tbl_extend("keep", {
			-- 		root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
			-- 		capabilities = capabilities,
			-- 		on_attach = function(client, bufnr)
			-- 			client.server_capabilities.documentFormattingProvider = false
			-- 			client.server_capabilities.documentRangeFormattingProvider = false
			-- 			on_attach(client, bufnr)
			-- 		end,
			-- 	}, default_opts),
			-- }

			lspconfig.vtsls.setup(vim.tbl_extend("keep", {
				root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					on_attach(client, bufnr)
				end,
			}, default_opts))

			lspconfig.eslint.setup(vim.tbl_extend("keep", {
				root_dir = lspconfig.util.root_pattern "package.json",
			}, default_opts))

			lspconfig.emmet_language_server.setup(vim.tbl_extend("keep", {
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
					on_attach(client, bufnr)
				end,
			}, default_opts))

			local runtime_path = vim.split(package.path, ";")
			table.insert(runtime_path, "lua/?.lua")
			table.insert(runtime_path, "lua/?/init.lua")
			lspconfig.lua_ls.setup(vim.tbl_extend("keep", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					on_attach(client, bufnr)
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
			}, default_opts))

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
		config = function(_, opts)
			require("lspsaga").setup(opts)
		end,
	},
}
