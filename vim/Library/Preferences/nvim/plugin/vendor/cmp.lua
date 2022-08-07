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

cmp.setup {
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
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
}
