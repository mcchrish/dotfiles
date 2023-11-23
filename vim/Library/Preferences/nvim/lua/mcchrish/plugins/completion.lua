return {
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		init = function()
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
		end,
		opts = function()
			local cmp = require "cmp"
			local kind_icons = {
				Class = "⬢",
				Color = "❁",
				Constant = "π",
				Constructor = "⬡",
				Enum = "☷",
				EnumMember = "☷",
				Event = "⤸",
				Field = "◧",
				File = "⟔",
				Folder = "⧸",
				Function = "λ",
				Interface = "□",
				Keyword = "ᴋ",
				Method = "λ",
				Module = "■",
				Operator = "÷",
				Property = "⋯",
				Reference = "→",
				Snippet = "◸",
				Struct = "▣",
				Text = "ᴀ",
				TypeParameter = "ᴛ",
				Unit = "␣",
				Value = "🞇",
				Variable = "𝑣",
			}

			return {
				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
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
					["<c-e>"] = cmp.mapping.abort(),
					["<cr>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
