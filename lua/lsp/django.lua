local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				pylsp_mypy = { enabled = true },
				pycodestyle = {
					enabled = true,
					ignore = { "E501", "E231", "W503" },
					maxLineLength = 79,
				},
				pylint = {
					enabled = true,
					executable = "pylint",
					args = {
						"--disable=C0111",
						"--enable=W0614",
						"--load-plugins=pylint_celery,pylint_django",
						"--django-settings-module=hopofy.settings",
						"--suggestion-mode=yes",
						"--function-naming-style=snake_case",
						"--include-naming-hint=yes",
					},
				},
			},
		},
	},
})
