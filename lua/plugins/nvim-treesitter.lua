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
			"gitignore",
			"http",
			"json",
			"scss",
			"sql",
			"graphql",
			-- low level
			-- "c",
			-- "zig",
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
	},
}
