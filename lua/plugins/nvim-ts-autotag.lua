return {
	"windwp/nvim-ts-autotag",
	ft = {
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"htmldjango",
	},
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
