local navic = require("nvim-navic")

local emmet_configs = {
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end,
	filetypes = {
		"html",
		"djangohtml",
		"htmldjango",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"svelte",
	},
}

return emmet_configs
