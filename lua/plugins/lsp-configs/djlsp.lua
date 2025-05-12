-- ملف: lua/plugins/lsp-configs/pylsp.lua

local djlsp_config = {
	cmd = { "djlsp" },
	init_options = {
		django_settings_module = "hopofy.settings",
		-- docker_compose_file = "docker-compose.yml",
		-- docker_compose_service = "django",
	},
}

return djlsp_config
