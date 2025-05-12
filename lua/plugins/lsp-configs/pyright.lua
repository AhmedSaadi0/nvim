-- lua/plugins/lsp-configs/pyright.lua
local pyright_config = {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off", -- Enable strict mode
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				extraPaths = { "path/to/your/project" }, -- Add project root
				diagnosticSeverityOverrides = {
					reportMissingImports = "warning",
					reportUnusedVariable = "information",
				},
				-- Add Django-specific type stubs
				stubPath = "typings", -- Create this directory for custom stubs
				typeCheckingStrategies = {
					-- Ignore Django ORM fields if needed
					["django.db.models"] = "skip",
				},
			},
		},
	},
	filetypes = { "python" },
	on_attach = function(client, bufnr)
		-- Your keymaps remain unchanged
		print("INNN")
	end,
}

return pyright_config
