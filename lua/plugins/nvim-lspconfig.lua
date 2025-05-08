return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Load all your existing configuration modules
		local type_lsp_config = require("plugins.lsp-configs.typo_lsp")
		local eslint_config = require("plugins.lsp-configs.eslint")
		local lua_ls_config = require("plugins.lsp-configs.lua_ls")
		local pyright_config = require("plugins.lsp-configs.pyright")
		local efm_configs = require("plugins.lsp-configs.efm")
		local pylsp_config = require("plugins.lsp-configs.pylsp")
		local graphql_configs = require("plugins.lsp-configs.graphql")
		local emmet_ls_config = require("plugins.lsp-configs.emmet_ls")

		-- Diagnostic signs setup (unchanged)
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		vim.diagnostic.config({
			virtual_text = true, -- Keep or adjust based on your preference
			signs = true, -- Enable diagnostic signs
			update_in_insert = false, -- Set based on your preference
			severity_sort = true, -- Sort diagnostics by severity

			-- Define your custom signs
			signs = {
				Error = { text = " " },
				Warn = { text = " " },
				Hint = { text = "󰠠 " },
				Info = { text = " " },
			},
		})

		-- Optional: Customize highlight groups if needed
		vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#db4b4b" })
		vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#e0af68" })
		vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#1abc9c" })
		vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#0db9d7" })

		-- Keymapping setup (unchanged)
		local keymapping_config = require("plugins.lsp-configs.keymap")
		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		-- Merge capabilities with server-specific configs
		local function add_capabilities(config)
			return vim.tbl_extend("force", { capabilities = capabilities }, config)
		end

		-- QML Server (direct setup)
		lspconfig.qmlls.setup(add_capabilities({
			cmd = { "qmlls" },
			filetypes = { "qml" },
			root_dir = lspconfig.util.root_pattern(".git", "*.qml", "*.pro"),
		}))

		-- Jinja-LSP (direct setup)
		lspconfig.jinja_lsp.setup(add_capabilities({
			cmd = { "jinja-lsp" },
			filetypes = { "html", "htmldjango", "jinja", "django-html" },
		}))

		-- All other servers using your existing config modules
		lspconfig.typos_lsp.setup(add_capabilities(type_lsp_config))
		lspconfig.lua_ls.setup(add_capabilities(lua_ls_config))
		lspconfig.eslint.setup(add_capabilities(eslint_config))
		lspconfig.pyright.setup(add_capabilities(pyright_config))
		lspconfig.efm.setup(add_capabilities(efm_configs))
		lspconfig.pylsp.setup(add_capabilities(pylsp_config))
		lspconfig.graphql.setup(add_capabilities(graphql_configs))
		lspconfig.emmet_ls.setup(add_capabilities(emmet_ls_config))

		-- Optional: Default handler for any remaining Mason-installed servers
		-- require("mason-lspconfig").setup_handlers({
		-- 	function(server_name)
		-- 		lspconfig[server_name].setup({ capabilities = capabilities })
		-- 	end,
		-- })
	end,
}
