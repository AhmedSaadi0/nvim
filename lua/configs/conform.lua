local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		-- html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		htmldjango = { "djlint", "djhtml" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = true,
		timeout_ms = 10000,
	},
	formatters = {
		prettier = {
			javascript = {
				args = { "--single-quote" },
			},
		},
		-- black = {
		-- 	args = { "line-length", "79" },
		-- },
	},
}

require("conform").setup(options)
