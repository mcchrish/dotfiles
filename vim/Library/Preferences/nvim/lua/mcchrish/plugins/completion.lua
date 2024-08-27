return {

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library items can be absolute paths
				-- "~/projects/my-awesome-lib",
				-- Or relative, which means they will be resolved as a plugin
				-- "LazyVim",
				-- When relative, you can also provide a path to the library in the plugin dir
				"luvit-meta/library", -- see below
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

	{
		"yioneko/nvim-cmp",
		branch = "perf",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
				config = function()
					local luasnip = require "luasnip"
					luasnip.config.setup {}
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				opts = {},
				config = function(_, opts)
					require("copilot_cmp").setup(opts)
				end,
			},
		},
		opts = function(_, opts)
			local cmp = require "cmp"
			local luasnip = require "luasnip"
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = function(entry, item)
						-- Kind icons
						item.kind = string.format("%s  %s", kind_icons[item.kind], item.kind) -- This concatonates the icons with the name of the item kind
						-- Source
						item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
							copilot = "[Copilot]",
						})[entry.source.name]
						return require("nvim-highlight-colors").format(entry, item)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert {
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),
					["<a-space>"] = cmp.mapping.complete {},
					["<a-i>"] = cmp.mapping.complete {
						config = {
							sources = cmp.config.sources {
								{ name = "copilot" },
							},
						},
					},
					["<a-s>"] = cmp.mapping.complete {
						config = {
							sources = cmp.config.sources {
								{ name = "luasnip" },
							},
						},
					},
					["<c-e>"] = cmp.mapping.abort(),
					["<c-y>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						entry_filter = function(entry)
							return not (
								entry:get_kind() == require("cmp.types").lsp.CompletionItemKind.Snippet
								and entry.source:get_debug_name() == "nvim_lsp:emmet_language_server"
							)
						end,
					},
					{ name = "luasnip" },
					-- { name = "copilot" },
					{ name = "path" },
					{ name = "nvim_lsp_signature_help" },
				}, {
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
				}),
			}
		end,
	},
}
