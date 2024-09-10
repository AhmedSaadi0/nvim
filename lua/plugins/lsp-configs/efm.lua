local efo_configs = {
	init_options = { documentFormatting = true, codeAction = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			htmldjango = {
				{
					lintCommand = "djlint",
					lintStdin = true,
					-- lintFormats = { "%f:%l:%c: %m" },
					-- formatCommand = "djhtml",
					-- formatStdin = true,
				},
			},
			html = {
				{
					lintCommand = "djlint --lint --quiet",
					lintStdin = true,
					-- lintFormats = { "%f:%l:%c: %m" },
					-- formatCommand = "djhtml",
					-- formatStdin = true,
				},
			},
			-- Add additional configurations for other filetypes if needed
		},
	},
	filetypes = { "htmldjango", "html" }, -- Add more filetypes if needed
}

return efo_configs
