return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>c", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		providers = {
			lsp = {
				client_filter = function(client)
					if vim.bo.filetype == "python" then
						return client.name == "pyright"
					end
					return true
				end,
			},
		},
		symbol_folding = {
			autofold_depth = 1,
			auto_unfold = {
				only = 3,
			},
			animation = {
				enable = true,
				duration = 100,
			},
		},
		symbols = {
			filter = {
				default = { "String", "Comment", exclude = true },
				python = {
					"Function",
					"Class",
					"Method",
					"Module",
					"Variable",
					"Constant",
					"Attribute",
				},
			},
			display = {
				python = {
					Function = { icon = "ƒ", hl = "TSFunction" },
					Class = { icon = "𝓒", hl = "TSClass" },
					Method = { icon = "ƒ", hl = "TSMethod" },
					Module = { icon = "📦", hl = "TSModule" },
					Variable = { icon = "", hl = "TSConstant" },
					Constant = { icon = "π", hl = "TSConstant" },
				},
			},
			sort = {
				enable = true,
				method = "frequency",
			},
		},
		outline_window = {
			width = 20,
			position = "right",
			border = "rounded",
			keymaps = {
				close = { "q", "<Esc>" },
				jump = { "<CR>", "<2-LeftMouse>" },
				hover = "K",
				toggle_symbol_details = "d",
				toggle_all_symbols = "a",
				search = "/",
			},
			preview = {
				enable = true,
				height = 10,
				border = "rounded",
				win_options = {
					winblend = 10,
				},
			},
		},
	},
}
