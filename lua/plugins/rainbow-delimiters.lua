return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		-- Assign the highlight groups to rainbow-delimiters
		vim.g.rainbow_delimiters = {
			highlight = {
				"IndentSymbolGreen",
				"IndentSymbolOrange",
				"IndentSymbolRed",
				"IndentSymbolPurple",
				"IndentSymbolYellow",
				"IndentSymbolCyan",
				"IndentSymbolBlue",
			},
		}
	end,
}
