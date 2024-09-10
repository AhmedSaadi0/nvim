return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		-- Your setup opts here
		symbol_folding = {
			autofold_depth = 1,

			auto_unfold = {
				only = 2,
			},
		},
		symbols = {
			filter = {
				default = { "String", exclude = true },
				-- python = { "Function", "Class" },
			},
		},
	},
}
