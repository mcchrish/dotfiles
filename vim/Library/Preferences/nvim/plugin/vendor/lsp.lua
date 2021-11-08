local function on_attach(client, bufnr, custom_opts)
	local opts = vim.tbl_extend("keep", custom_opts or {}, { format_on_save = false })

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local map_opts = { noremap = true }

	-- stylua: ignore start
	buf_set_keymap("n", "gD",			"<cmd>lua vim.lsp.buf.declaration()<cr>", map_opts)
	buf_set_keymap("n", "gd",			"<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
	buf_set_keymap("n", "K",			"<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
	buf_set_keymap("n", "gi",			"<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
	-- @todo must think another key as it conflicts with window nav
	-- buf_set_keymap("n", "<c-k>",		"<cmd>lua vim.lsp.buf.signature_help()<cr>", map_opts)
	buf_set_keymap("n", "<leader>wa",	"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", map_opts)
	buf_set_keymap("n", "<leader>wr",	"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", map_opts)
	buf_set_keymap("n", "<leader>wl",	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", map_opts)
	buf_set_keymap("n", "<leader>D",	"<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
	buf_set_keymap("n", "<leader>rn",	"<cmd>lua vim.lsp.buf.rename()<cr>", map_opts)
	buf_set_keymap("n", "<leader>ca",	"<cmd>lua vim.lsp.buf.code_action()<cr>", map_opts)
	buf_set_keymap("n", "gr",			"<cmd>lua vim.lsp.buf.references()<cr>", map_opts)
	buf_set_keymap("n", "<leader>e",	"<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<cr>", map_opts)
	buf_set_keymap("n", "[d",			"<cmd>lua vim.diagnostic.goto_prev()<cr>", map_opts)
	buf_set_keymap("n", "]d",			"<cmd>lua vim.diagnostic.goto_next()<cr>", map_opts)
	buf_set_keymap("n", "<leader>q",	"<cmd>lua vim.diagnostic.set_loclist()<cr>", map_opts)
	buf_set_keymap("n", "<leader>p",	"<cmd>lua vim.lsp.buf.formatting()<cr>", map_opts)
	-- stylua: ignore end

	if client.resolved_capabilities.document_formatting and opts.format_on_save then
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
	end

	-- vim.api.nvim_command [[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })]]
end

local lspconfig = require "lspconfig"
local default_opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = vim.tbl_extend("keep", {}, default_opts)
	if server.name == "tsserver" then
		opts.root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json")
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			on_attach(client, bufnr)
		end
		-- elseif server.name == "tailwindcss" then
		-- 	opts.root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts")
	elseif server.name == "volar" or server.name == "intelephense" then
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			on_attach(client, bufnr)
		end
	elseif server.name == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		opts.settings = {
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
		}
	end

	-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
	server:setup(require("coq").lsp_ensure_capabilities(opts))
end)

-- null-ls
local null_ls = require "null-ls"
null_ls.config {
	sources = {
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with {
			filetypes = vim.list_extend({ "php" }, null_ls.builtins.formatting.prettier.filetypes),
		},
	},
}
lspconfig["null-ls"].setup(default_opts)

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
	use_lsp_diagnostic_signs = true,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	update_in_insert = false,
})
