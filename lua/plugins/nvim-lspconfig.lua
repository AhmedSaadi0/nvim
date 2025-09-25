return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- local lspconfig = vim.lsp.config
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymapping_config = require("plugins.lsp-configs.keymap")

		-- Load server-specific configurations
		local typos_lsp_config = require("plugins.lsp-configs.typo_lsp")
		local eslint_config = require("plugins.lsp-configs.eslint")
		local lua_ls_config = require("plugins.lsp-configs.lua_ls")
		local pyright_config = require("plugins.lsp-configs.pyright")
		local efm_configs = require("plugins.lsp-configs.efm")
		local pylsp_config_settings = require("plugins.lsp-configs.pylsp")
		local graphql_configs = require("plugins.lsp-configs.graphql")
		local emmet_ls_consigs = require("plugins.lsp-configs.emmet_ls")
		local djlsp_consigs = require("plugins.lsp-configs.djlsp")
		local navic = require("plugins.lsp-configs.navic")
		navic.setup()

		vim.diagnostic.config({
			signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " },
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		-- Base capabilities for most LSPs
		local base_capabilities = cmp_nvim_lsp.default_capabilities()

		-- Capabilities for Pyright (full)
		local pyright_capabilities = vim.deepcopy(base_capabilities)

		-- Capabilities for Pylsp (customized to disable overlapping features)
		local pylsp_capabilities = vim.deepcopy(base_capabilities)
		pylsp_capabilities.textDocument.definition = nil
		pylsp_capabilities.textDocument.hover = nil
		pylsp_capabilities.textDocument.implementation = nil
		pylsp_capabilities.textDocument.references = nil
		pylsp_capabilities.textDocument.rename = nil
		pylsp_capabilities.textDocument.typeDefinition = nil
		pylsp_capabilities.textDocument.completion = nil

		local function setup_server(server_name, user_config, capabilities_to_use)
			local cfg = vim.tbl_extend("force", user_config or {}, {
				capabilities = capabilities_to_use,
				on_attach = function(client, bufnr)
					if user_config and user_config.on_attach then
						user_config.on_attach(client, bufnr)
					end
					-- navic.on_attach(client, bufnr)
				end,
			})
			vim.lsp.config[server_name] = cfg
			vim.lsp.enable({ server_name })
		end

		-- Setup LSPs
		setup_server("pyright", pyright_config, pyright_capabilities)
		setup_server("pylsp", pylsp_config_settings, pylsp_capabilities)
		setup_server("djlsp", djlsp_consigs, base_capabilities)
		setup_server("typos_lsp", typos_lsp_config, base_capabilities)
		setup_server("lua_ls", lua_ls_config, base_capabilities)
		setup_server("eslint", eslint_config, base_capabilities)
		setup_server("efm", efm_configs, base_capabilities)
		setup_server("graphql", graphql_configs, base_capabilities)
		setup_server("emmet_ls", emmet_ls_consigs, base_capabilities)

		vim.lsp.config["qmlls"] = vim.tbl_extend("force", {
			capabilities = base_capabilities,
		}, {})
		vim.lsp.enable({ "qmlls" })

		mason_lspconfig.setup()
	end,
}
