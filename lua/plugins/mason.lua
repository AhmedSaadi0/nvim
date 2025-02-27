local mason_config = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		-- local mason_lspconfig = require("mason-lspconfig")

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

		-- mason_lspconfig.setup({
		-- 	-- list of servers for mason to install
		-- 	ensure_installed = {},
		-- })

		mason_tool_installer.setup({
			ensure_installed = {
				"efm",
				"pyright",
				-- "flake8",

				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				-- "pylint",
				"eslint_d",
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
				"html-lsp",
				"css-lsp",
				"djlint",
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
			},
		})
	end,
}

return mason_config
