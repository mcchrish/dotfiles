-- local saga = require "lspsaga"
-- saga.init_lsp_saga()

local wk = require "which-key"

wk.register({
	["<leader>"] = {
		e = {
			function()
				vim.diagnostic.open_float(0, { scope = "line" })
			end,
			"Open diagnostics hover",
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

local function on_attach(client, bufnr, custom_opts)
	local opts = vim.tbl_extend("keep", custom_opts or {}, { format_on_save = false })

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	wk.register({
		g = {
			D = { vim.lsp.buf.declaration, "LSP declaration" },
			d = { vim.lsp.buf.definition, "LSP definition" },
			i = { vim.lsp.buf.implementation, "LSP implementation" },
			r = { vim.lsp.buf.references, "LSP references" },
		},
		K = { vim.lsp.buf.hover, "LSP Hover" },
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
		["<leader>D"] = { vim.lsp.buf.type_definition, "LSP type definition" },
		["<leader>rn"] = { vim.lsp.buf.rename, "LSP rename" },
		["<leader>ca"] = { vim.lsp.buf.code_action, "LSP code action" },
		["<leader>p"] = {
			function()
				vim.lsp.buf.format { async = true }
			end,
			"LSP format",
		},
	}, { noremap = true, silent = true, buffer = bufnr })

	if client.server_capabilities.documentFormattingProvider and opts.format_on_save then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format { async = true }
			end,
		})
	end
end

local lspconfig = require "lspconfig"
require("mason").setup {}
require("mason-lspconfig").setup {
	ensure_installed = { "eslint", "sumneko_lua", "tsserver" },
}
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local default_opts = {
	on_attach = on_attach,
}

require("typescript").setup {
	server = vim.tbl_extend("keep", {
		root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
	}, default_opts),
}

lspconfig.eslint.setup(vim.tbl_extend("keep", {}, default_opts))

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup(vim.tbl_extend("keep", {
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

-- null-ls
local null_ls = require "null-ls"
null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
	},
	on_attach = function(client, bufnr)
		on_attach(client, bufnr, { format_on_save = true })
	end,
}

-- signs
local signs = { Error = "▬", Warn = "▪", Hint = "▪", Info = "⋅" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

-- trouble
require("trouble").setup {
	icons = false,
	fold_open = "▶",
	fold_closed = "▼",
	action_keys = {
		close = "gq",
		open_split = { "<c-s>" },
	},
	use_diagnostic_signs = true,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	update_in_insert = false,
})
