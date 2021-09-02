local lspconfig = require "lspconfig"
local null_ls = require "null-ls"
local coq = require "coq"

table.insert(null_ls.builtins.formatting.prettier.filetypes, "php")

null_ls.config {
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint_d,
	},
}

local default_config = { format_on_save = false }
local function on_attach(client, bufnr, custom_opts)
	local opts = vim.tbl_extend("force", default_config, custom_opts or {})

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
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
	buf_set_keymap("n", "<leader>e",	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", map_opts)
	buf_set_keymap("n", "[d",			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", map_opts)
	buf_set_keymap("n", "]d",			"<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", map_opts)
	buf_set_keymap("n", "<leader>q",	"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", map_opts)
	buf_set_keymap("n", "<leader>p",	"<cmd>lua vim.lsp.buf.formatting()<cr>", map_opts)
	-- stylua: ignore end

	if client.resolved_capabilities.document_formatting and opts.format_on_save then
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
	end
end

local servers = {
	"null-ls",
	tsserver = {
		root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require "nvim-lsp-ts-utils"
			ts_utils.setup {
				eslint_bin = "eslint_d",
				eslint_enable_diagnostics = true,
				eslint_show_rule_id = true,
			}
			ts_utils.setup_client(client)

			on_attach(client, bufnr)
		end,
	},
	"vuels",
	tailwindcss = {
		root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
	},
	intelephense = {
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			on_attach(client, bufnr)
		end,
	},
}

local default_config = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}

for k, v in pairs(servers) do
	local key = type(k) == "number" and v or k
	lspconfig[key].setup(
		coq.lsp_ensure_capabilities(type(v) == "table" and vim.tbl_extend("force", default_config, v) or default_config)
	)
end

local signs = { Error = "▬", Warning = "▪", Hint = "▪", Information = "⋅" }

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl })
end
