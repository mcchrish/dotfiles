-- local saga = require "lspsaga"
-- saga.init_lsp_saga()

local mapopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(0, { scope = "line" })
end, mapopts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, mapopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, mapopts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, mapopts)

local function on_attach(client, bufnr, custom_opts)
	local opts = vim.tbl_extend("keep", custom_opts or {}, { format_on_save = false })

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- @todo must think another key as it conflicts with window nav
	-- vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>p", vim.lsp.buf.formatting, bufopts)

	if client.resolved_capabilities.document_formatting and opts.format_on_save then
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
	end
end

local lspconfig = require "lspconfig"
require("mason").setup {}
require("mason-lspconfig").setup {
	ensure_installed = { "eslint", "sumneko_lua", "tsserver" },
}
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local default_opts = {
	on_attach = on_attach,
}

require("typescript").setup {
	server = vim.tbl_extend("keep", {
		root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
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
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
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
	on_attach = on_attach,
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
