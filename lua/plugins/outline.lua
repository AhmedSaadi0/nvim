return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		-- Add additional keymaps for symbol navigation
		{ "<leader>os", "<cmd>Telescope outline<CR>", desc = "Search symbols" }, -- Requires telescope.nvim
	},
	opts = {
		symbol_folding = {
			autofold_depth = 1,
			auto_unfold = {
				only = 3,
			},
			-- Add animations for better UX
			animation = {
				enable = true,
				duration = 400,
			},
		},
		symbols = {
			filter = {
				-- Add more granular filtering
				default = { "String", "Comment", exclude = true },
				python = {
					"Function",
					"Class",
					"Method",
					"Module",
					"Variable",
					"Constant",
					"Attribute", -- Additional relevant symbols
				},
			},
			display = {
				python = {
					Function = { icon = "ƒ", hl = "TSFunction" },
					Class = { icon = "𝓒", hl = "TSClass" },
					Method = { icon = "ƒ", hl = "TSMethod" },
					Module = { icon = "📦", hl = "TSModule" },
					Variable = { icon = "", hl = "TSConstant" },
					Constant = { icon = "π", hl = "TSConstant" }, -- New constant symbol
				},
			},
			-- Add sorting configuration
			sort = {
				enable = true,
				method = "frequency", -- Sort by usage frequency
			},
		},
		outline_window = {
			width = 25, -- Slightly wider for better readability
			position = "right", -- Alternative position
			border = "rounded", -- Modern border style
			keymaps = {
				close = { "q", "<Esc>" },
				jump = { "<CR>", "<2-LeftMouse>" },
				hover = "K",
				toggle_symbol_details = "d",
				toggle_all_symbols = "a", -- New global toggle
				search = "/", -- Quick search functionality
			},
			-- Add preview window configuration
			preview = {
				enable = true,
				height = 10,
				border = "rounded",
				win_options = {
					winblend = 10,
				},
			},
		},
		lsp = {
			auto_attach = true,
			-- Add multi-LSP support
			servers = {
				"pyright",
				"tsserver",
				"clangd", -- Explicitly support multiple languages
			},
			-- Improve diagnostics integration
			diagnostics = {
				enable = true,
				icons = {
					error = "✘",
					warning = "⚠",
					info = "ℹ",
					hint = "",
				},
			},
		},
		-- Add performance optimizations
		performance = {
			debounce_delay = 150,
			max_file_size = 2048, -- KB
			async = true,
		},
		-- Add status line integration
		statusline = {
			enable = true,
			symbol_count = true,
			file_path = true,
		},
	},
}
