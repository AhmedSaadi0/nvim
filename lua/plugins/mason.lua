local mason_config = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	opts = {
		ensure_installed = {
			"shellcheck",
			"shfmt",
			"black",
			"debugpy",
			"mypy",
			"isort",
			"ruff",
			"js-debug-adapter",
			"prettier",
			"stylua",
			"bash-language-server",
			"nginx-language-server",
			"lua-language-server",
			"typescript-language-server",
			"eslint-lsp",
			"html-lsp",
			"css-lsp",
			"djlint",
			"pyright",
			"pylint",
			"eslint_d",
			"cairo-language-server",
			"vim-language-server",
			"yaml-language-server",
			"kotlin-language-server",
			"python-lsp-server",
		},
		-- indent = {
		-- 	enable = true,
		-- 	-- disable = {
		-- 	--   "python"
		-- 	-- },
		-- },
	},
}

return mason_config
