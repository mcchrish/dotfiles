vim.g.coq_settings = {
	-- conflicts with window nav keys. Disable for now
	keymap = {
		jump_to_mark = "",
		bigger_preview = "",
		recommended = false,
	},
	clients = {
		tags = {
			enabled = false,
		},
	},
	display = {
		ghost_text = {
			enabled = false,
		},
		pum = {
			fast_close = false,
		},
		icons = {
			mode = "long",
			aliases = {
				Enum = "Value",
				EnumMember = "Value",
				Method = "Constructor",
				Boolean = "Value",
				Character = "Value",
				String = "Value",
			},
			mappings = {
				Class = "⬢",
				Color = "❁",
				Constant = "π",
				Constructor = "⬡",
				Event = "⤸",
				Field = "◧",
				File = "⟔",
				Folder = "⧸",
				Function = "λ",
				Interface = "□",
				Keyword = "ᴋ",
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
			},
		},
	},
}
