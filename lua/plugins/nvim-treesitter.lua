return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	opts = {
		ensure_installed = {
			"css",
			"gitignore",
			"graphql",
			"html",
			"htmldjango",
			"http",
			"javascript",
			"json",
			"lua",
			"markdown",
			"python",
			"scss",
			"sql",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
