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
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local keymapping_config = require("plugins.lsp-configs.keymap")

		local typos_lsp_config = require("plugins.lsp-configs.typo_lsp")
		local eslint_config = require("plugins.lsp-configs.eslint")
		local lua_ls_config = require("plugins.lsp-configs.lua_ls")
		local pyright_config = require("plugins.lsp-configs.pyright")
		local efm_configs = require("plugins.lsp-configs.efm")
		local pylsp_config = require("plugins.lsp-configs.pylsp")
		-- local tsserver_configs = require("plugins.lsp-configs.tsserver")
		local graphql_configs = require("plugins.lsp-configs.graphql")
		local emmet_ls_consigs = require("plugins.lsp-configs.emmet_ls")
		local djlsp_consigs = require("plugins.lsp-configs.djlsp")

		vim.diagnostic.config({
			signs = {
				Error = " ",
				Warn = " ",
				Hint = "󰠠 ",
				Info = " ",
			},
			-- Optional: Keep other diagnostic settings (e.g., virtual_text, underline)
			virtual_text = true,
			underline = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", keymapping_config)

		local function add_capabilities(additional_config)
			return vim.tbl_extend("force", { capabilities = capabilities }, additional_config)
		end

		lspconfig["pyright"].setup(add_capabilities(pyright_config))
		lspconfig["pylsp"].setup(add_capabilities(pylsp_config))
		lspconfig["djlsp"].setup(add_capabilities(djlsp_consigs))
		-- lspconfig["jinja_lsp"].setup({
		-- 	capabilities = capabilities,
		-- 	cmd = { "jinja-lsp" },
		-- 	filetypes = { "html", "htmldjango", "jinja", "django-html" }, -- Specify the filetypes
		-- })
		-- lspconfig["typos_lsp"].setup(add_capabilities(typos_lsp_config))
		lspconfig["lua_ls"].setup(add_capabilities(lua_ls_config))
		lspconfig["eslint"].setup(add_capabilities(eslint_config))
		lspconfig["efm"].setup(add_capabilities(efm_configs))
		lspconfig["graphql"].setup(add_capabilities(graphql_configs))
		lspconfig["emmet_ls"].setup(add_capabilities(emmet_ls_consigs))
		lspconfig["qmlls"].setup({
			cmd = { "qmlls" },
			filetypes = { "qml" },
			root_dir = lspconfig.util.root_pattern(".git", "*.qml", "*.pro"),
			capabilities = capabilities,
		})
		mason_lspconfig.setup()
	end,
}
