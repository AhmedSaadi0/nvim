local efm_config = {
	filetypes = {
		"htmldjango",
	},
	init_options = {
		documentFormatting = false, -- Disable formatting
		documentRangeFormatting = false, -- Disable range formatting
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	settings = {
		languages = {
			htmldjango = {
				command = "flake8", -- Linter command for htmldjango files
				rootMarkers = { ".git/" }, -- This ensures flake8 runs in the root of a git project
				args = { "--max-line-length=88" }, -- Custom arguments to flake8, adjust as needed
				filetypes = { "htmldjango" }, -- Apply this linter specifically to htmldjango files
			},
		},
	},
}

return efm_config
