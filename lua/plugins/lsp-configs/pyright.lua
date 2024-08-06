-- lua/plugins/lsp-configs/pyright.lua
local pyright_config = {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
			},
		},
	},
	filetypes = { "python" },
}

return pyright_config
