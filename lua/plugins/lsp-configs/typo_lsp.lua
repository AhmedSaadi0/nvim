local typos_config_path = "~/.config/nvim/lua/plugins/lsp-configs/typo_lsp_config.toml"

-- Function to set up typos_lsp
-- Check if the config file exists
local config_exists = vim.fn.filereadable(vim.fn.expand(typos_config_path))
if config_exists == 0 then
	vim.notify("Typos config file not found: " .. typos_config_path, vim.log.levels.ERROR)
	return
end

-- Configuration settings

-- Typo LSP configuration
local typo_lsp_config = {
	cmd = { "typos-lsp" },
	cmd_env = { RUST_LOG = "debug" }, -- Increase log level to debug
	init_options = {
		config = typos_config_path,
		diagnosticSeverity = "Error",
	},
	on_attach = function(client, bufnr)
		print("Typos LSP attached to buffer " .. bufnr)
	end,
	on_init = function(client)
		print("Typos LSP initialized")
	end,
}

return typo_lsp_config