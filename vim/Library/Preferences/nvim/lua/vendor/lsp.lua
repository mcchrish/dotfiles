return function()
	local null_ls = require "null-ls"
	null_ls.config {
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
		},
	}

	local nvim_lsp = require "lspconfig"

	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		--Enable completion triggered by <c-x><c-o>
		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		local opts = { noremap = true, silent = true }

		buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
		buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
		buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
		buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)
		buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
		buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
		buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", opts)
		buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
	end

	local servers = {
		["tsserver"] = {
			on_attach = function(...)
				client.resolved_capabilities.document_formatting = false
				on_attach(...)
			end,
		},
		"vuels",
		"intelephense",
		"null-ls",
	}

	local default_config = {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	}

	for config, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup(type(config) == "table" and vim.tbl_extend("force", default_config, config) or default_config)
	end
end
