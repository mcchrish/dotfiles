-- :h lua-highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_user_command("Snitch", function(opts)
	local cmd = { "code" }
	if opts.args == "" then
		local fname = vim.api.nvim_buf_get_name(0)
		local cpos = vim.api.nvim_win_get_cursor(0)
		local fnamecol = fname .. ":" .. cpos[1] .. ":" .. (cpos[2] + 1)
		cmd = vim.list_extend(cmd, { "-g", fnamecol })
	else
		cmd = vim.list_extend(cmd, opts.fargs)
	end
	vim.fn.jobstart(cmd)
end, { nargs = "*", complete = "file" })

-- Common typo
vim.cmd.cnoreabbrev "w; w"
