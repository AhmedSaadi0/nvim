return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			-- defaults
			"vim",
			"lua",
			"vimdoc",

			-- web dev
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"htmldjango",

			-- low level
			"c",
			"zig",
		},
	},
}
