local mason_config = {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {

			"vim",
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			-- "tsx",
			-- "c",
			-- "markdown",
			-- "markdown_inline",

			"black",
			"debugpy",
			"mypy",
			"isort",
			-- "flake8",
			-- "pylint",
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
			-- "djls",
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
