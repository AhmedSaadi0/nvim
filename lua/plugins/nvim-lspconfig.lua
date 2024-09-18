return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	-- event = { "BufWritePost", "InsertLeave" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

		-- Load LSP custom key mappings
		local keymapping_config = require("plugins.lsp-configs.keymap")

		-- Load LSP configurations
		local type_lsp_config = require("plugins.lsp-configs.typo_lsp")
		local eslint_config = require("plugins.lsp-configs.eslint")
		local lua_ls_config = require("plugins.lsp-configs.lua_ls")
		local pyright_config = require("plugins.lsp-configs.pyright")
		local efm_configs = require("plugins.lsp-configs.efm")
		local pylsp_config = require("plugins.lsp-configs.pylsp")
		-- local tsserver_configs = require("plugins.lsp-configs.tsserver")
		local graphql_configs = require("plugins.lsp-configs.graphql")
		local emmet_ls_consigs = require("plugins.lsp-configs.emmet_ls")

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		local function add_capabilities(additional_config)
			return vim.tbl_extend("force", { capabilities = capabilities }, additional_config)
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["typos_lsp"] = function()
				lspconfig["typos_lsp"].setup(add_capabilities(type_lsp_config))
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup(add_capabilities(lua_ls_config))
			end,
			["eslint"] = function()
				lspconfig["eslint"].setup(add_capabilities(eslint_config))
			end,
			["pyright"] = function()
				lspconfig["pyright"].setup(add_capabilities(pyright_config))
			end,
			["efm"] = function()
				lspconfig["efm"].setup(add_capabilities(efm_configs))
			end,
			["pylsp"] = function()
				lspconfig["pylsp"].setup(add_capabilities(pylsp_config))
			end,
			-- ["tsserver"] = function()
			-- 	lspconfig["tsserver"].setup(add_capabilities(tsserver_configs))
			-- end,
			["graphql"] = function()
				lspconfig["graphql"].setup(add_capabilities(graphql_configs))
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup(add_capabilities(emmet_ls_consigs))
			end,
			["vala"] = function()
				local lspconfig = require("lspconfig")
				lspconfig.valalsp.setup({
					-- on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						vala = {
							lint = {
								style = true, -- Enable style checking
								fix = true, -- Enable automatic fixing
							},
						},
					},
				})
			end,
		})

		-- vim.api.nvim_create_autocmd("BufWritePost", {
		-- 	callback = function()
		-- 		update_pylsp_settings(true)
		-- 	end,
		-- })
	end,
}
