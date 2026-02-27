return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { layout = { position = "left", width = 35 } },
				},
			},
		},
		explorer = { enabled = true },
		lazygit = { enabled = true },
		indent = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = require("plugins.snacks-configs.dashboard"),
		bigfile = require("plugins.snacks-configs.bigfile"),
		image = require("plugins.snacks-configs.image"),
		input = require("plugins.snacks-configs.input"),
		notifier = require("plugins.snacks-configs.notifier"),
		scope = require("plugins.snacks-configs.scope"),
		scroll = require("plugins.snacks-configs.scroll"),
		statuscolumn = require("plugins.snacks-configs.statuscolumn"),
		words = require("plugins.snacks-configs.words"),
	},
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
}
