local navic = require("nvim-navic")

local pylsp_consigs = {
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				pycodestyle = {
					enabled = true,
					ignore = { "E501", "E231", "W503" },
					maxLineLength = 79,
				},
				pylint = {
					enabled = true,
					executable = "pylint",
					args = {
						"--enable=W0611,W0614",
					},
				},
			},
		},
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end,
}

return pylsp_consigs
