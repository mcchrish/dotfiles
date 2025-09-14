return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				-- auto_trigger = true,
				-- hide_during_completion = false,
				keymap = {
					accept = "<m-y>",
					accept_word = false,
					accept_line = false,
					next = "<m-]>",
					prev = "<m-[>",
					dismiss = "<m-Y>",
				},
			},
			panel = { enabled = false },
		},
	},
}
