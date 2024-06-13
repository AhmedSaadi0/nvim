vim.api.nvim_create_augroup("AutoSaveOnLeave", { clear = true })

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	group = "AutoSaveOnLeave",
	pattern = "*",
	callback = function()
		if vim.bo.modified then
			vim.cmd("write")
		end
	end,
})
