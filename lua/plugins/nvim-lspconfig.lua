-- Your main lsp config file (e.g., lua/plugins/lsp.lua or similar)
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- local lspconfig = vim.lsp.config
		-- local lspconfig = vim.lsp._config or require("lspconfig")

		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymapping_config = require("plugins.lsp-configs.keymap")

		-- Load server-specific configurations
		local typos_lsp_config = require("plugins.lsp-configs.typo_lsp")
		local eslint_config = require("plugins.lsp-configs.eslint")
		local lua_ls_config = require("plugins.lsp-configs.lua_ls")
		local pyright_config = require("plugins.lsp-configs.pyright")
		local efm_configs = require("plugins.lsp-configs.efm")
		local pylsp_config_settings = require("plugins.lsp-configs.pylsp") -- User's variable name
		local graphql_configs = require("plugins.lsp-configs.graphql")
		local emmet_ls_consigs = require("plugins.lsp-configs.emmet_ls")
		local djlsp_consigs = require("plugins.lsp-configs.djlsp")

		vim.diagnostic.config({
			signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " },
			virtual_text = true,
			underline = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		-- Base capabilities for most LSPs
		local base_capabilities = cmp_nvim_lsp.default_capabilities()

		-- Capabilities for Pyright (full)
		local pyright_capabilities = vim.deepcopy(base_capabilities)

		-- Capabilities for Pylsp (customized to disable overlapping features)
		local pylsp_capabilities = vim.deepcopy(base_capabilities)
		pylsp_capabilities.textDocument.definition = nil -- Disable Pylsp's definition provider
		pylsp_capabilities.textDocument.hover = nil -- Disable Pylsp's hover provider
		pylsp_capabilities.textDocument.implementation = nil
		pylsp_capabilities.textDocument.references = nil
		pylsp_capabilities.textDocument.rename = nil
		pylsp_capabilities.textDocument.typeDefinition = nil
		-- pylsp_capabilities.textDocument.completion = nil -- Optionally disable if you only want Pyright's completion

		-- Helper to merge user config with capabilities
		local function setup_server(server_name, user_config, capabilities_to_use)
			lspconfig[server_name].setup(vim.tbl_extend("force", {
				capabilities = capabilities_to_use,
			}, user_config))
		end

		-- Setup LSPs
		setup_server("pyright", pyright_config, pyright_capabilities)
		setup_server("pylsp", pylsp_config_settings, pylsp_capabilities) -- Use customized capabilities
		setup_server("djlsp", djlsp_consigs, base_capabilities)
		setup_server("typos_lsp", typos_lsp_config, base_capabilities)
		setup_server("lua_ls", lua_ls_config, base_capabilities)
		setup_server("eslint", eslint_config, base_capabilities)
		setup_server("efm", efm_configs, base_capabilities)
		setup_server("graphql", graphql_configs, base_capabilities)
		setup_server("emmet_ls", emmet_ls_consigs, base_capabilities)

		lspconfig["qmlls"].setup({
			cmd = { "qmlls" },
			filetypes = { "qml" },
			root_dir = lspconfig.util.root_pattern(".git", "*.qml", "*.pro"),
			capabilities = base_capabilities,
		})

		mason_lspconfig.setup()
	end,
}
