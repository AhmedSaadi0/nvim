return {
	"nvim-treesitter/nvim-treesitter",
	-- event = { "BufReadPost", "BufNewFile" },
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"graphql",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"htmldjango",
				"python",
				"scss",
				"sql",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"requirements",
				"qmljs",
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
		})
	end,
}
