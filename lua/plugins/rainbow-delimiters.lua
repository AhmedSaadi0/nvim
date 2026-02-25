return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "BufReadPre", -- يتم تحميل البلوقين عند فتح ملف
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"IndentSymbolGreen",
				"IndentSymbolOrange",
				"IndentSymbolRed",
				"IndentSymbolPurple",
				"IndentSymbolYellow",
				"IndentSymbolCyan",
				"IndentSymbolBlue",
			},
		})
	end,
}
