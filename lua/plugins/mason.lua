local mason_config = {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"black",
			"debugpy",
			"mypy",
			"isort",
			"ruff",
			"eslint-lsp",
			"js-debug-adapter",
			"prettier",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"djlint",
			"djhtml",
			"pyright",
			"pylint",
			"eslint_d",
			"stylua",
			"bash-language-server",
			"cql-language-server",
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
