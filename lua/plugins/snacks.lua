return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		picker = { enabled = true },
		dashboard = { enabled = true },
		notifier = { enabled = true },
		lazygit = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		bufdelete = { enabled = true },
	},
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
}
