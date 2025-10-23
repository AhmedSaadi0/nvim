-- Your main lsp config file (e.g., lua/plugins/lsp.lua or similar)
return {
	"neovim/nvim-lspconfig",
	branch = "master",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymapping_config = require("plugins.lsp-configs.keymap")
		local lspconfig_util = require("lspconfig.util")

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

		vim.diagnostic.config({
			signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " },
			virtual_text = true,
			underline = true,
		})

		-- *** السطر الذي تم تصحيحه ***
		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		-- Base capabilities for most LSPs
		local base_capabilities = cmp_nvim_lsp.default_capabilities()

		-- Capabilities for Pyright (full)
		local pyright_capabilities = vim.deepcopy(base_capabilities)

		-- Capabilities for Pylsp (customized)
		local pylsp_capabilities = vim.deepcopy(base_capabilities)
		pylsp_capabilities.textDocument.definition = nil
		pylsp_capabilities.textDocument.hover = nil
		pylsp_capabilities.textDocument.implementation = nil
		pylsp_capabilities.textDocument.references = nil
		pylsp_capabilities.textDocument.rename = nil
		pylsp_capabilities.textDocument.typeDefinition = nil

		-- Configure servers using the new API
		vim.lsp.config(
			"pyright",
			vim.tbl_extend("force", {
				capabilities = pyright_capabilities,
			}, pyright_config)
		)

		vim.lsp.config(
			"pylsp",
			vim.tbl_extend("force", {
				capabilities = pylsp_capabilities,
			}, pylsp_config_settings)
		)

		vim.lsp.config(
			"djlsp",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, djlsp_consigs)
		)

		vim.lsp.config(
			"typos_lsp",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, typos_lsp_config)
		)

		vim.lsp.config(
			"lua_ls",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, lua_ls_config)
		)

		vim.lsp.config(
			"eslint",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, eslint_config)
		)

		vim.lsp.config(
			"efm",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, efm_configs)
		)

		vim.lsp.config(
			"graphql",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, graphql_configs)
		)

		vim.lsp.config(
			"emmet_ls",
			vim.tbl_extend("force", {
				capabilities = base_capabilities,
			}, emmet_ls_consigs)
		)

		vim.lsp.config("qmlls", {
			cmd = { "qmlls" },
			-- filetypes = { "qml" },
			root_dir = lspconfig_util.root_pattern(".git", "*.qml", "*.pro"),
			capabilities = base_capabilities,
		})

		mason_lspconfig.setup()
	end,
}
