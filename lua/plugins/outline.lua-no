return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		symbol_folding = {
			autofold_depth = 1,
			auto_unfold = {
				only = 2,
			},
		},
		symbols = {
			filter = {
				default = { "String", exclude = true },
				-- Python-specific filtering: Now includes Variables
				python = { "Function", "Class", "Method", "Module", "Variable" },
			},
			display = {
				python = {
					Function = { icon = "ƒ", hl = "TSFunction" },
					Class = { icon = "𝓒", hl = "TSClass" },
					Method = { icon = "ƒ", hl = "TSMethod" },
					Module = { icon = "📦", hl = "TSModule" },
					Variable = { icon = "", hl = "TSConstant" }, -- Added display for Python variables
				},
			},
		},
		outline_window = {
			width = 35,
			keymaps = {
				close = "q",
				jump = "<CR>",
				hover = "K",
				toggle_symbol_details = "d",
			},
		},
		lsp = {
			auto_attach = true,
		},
	},
}
