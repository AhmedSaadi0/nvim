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
					-- using .pylintrc for each project is better
					-- args = {
					-- 	"--disable=C0111",
					-- 	"--enable=W0614",
					-- 	"--load-plugins=pylint_celery,pylint_django",
					-- 	"--django-settings-module=hopofy.settings",
					-- 	"--suggestion-mode=yes",
					-- 	"--function-naming-style=snake_case",
					-- 	"--include-naming-hint=yes",
					-- },
				},
			},
		},
	},
}

return pylsp_consigs
