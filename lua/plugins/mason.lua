local mason_config = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			automatic_installation = true,
			automatic_enable = true,
			ensure_installed = {
				"efm",
				"pyright",
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				-- "pylint",
				"shellcheck",
				"shfmt",
				"black",
				"debugpy",
				-- "mypy",
				"isort",
				-- "js-debug-adapter",
				"stylua",
				"bash-language-server",
				-- "nginx-language-server",
				"lua-language-server",
				"typescript-language-server",
				"eslint-lsp",
				-- "eslint_d",
				"html-lsp",
				"css-lsp",
				"djlint",
				"django-template-lsp",
				"pylint",
				"typos-lsp",
				"vim-language-server",
				-- "yaml-language-server",
				-- "kotlin-language-server",
				"python-lsp-server",
				"autoflake",

				-- "vala-language-server",
				"clang-format",
				"clangd",
				"alejandra", -- Nix
				-- "ruff",
				-- "nil", -- Nix Language server
				-- "jinja-lsp",
				"emmet-ls",
			},
		})
	end,
}

return mason_config
