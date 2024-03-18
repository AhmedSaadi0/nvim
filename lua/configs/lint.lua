require("lint").linters_by_ft = {
	javascript = { "eslint" },
	typescript = { "eslint" },
	htmldjango = { "djlint", "djhtml", "curlylint" },
	css = { "stylelint" },
	scss = { "stylelint" },
	less = { "stylelint" },
	json = { "jsonlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
