return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePost", "InsertLeave" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "autoflake", "isort", "black" },
				htmldjango = { "djlint" },
				bash = { "beautysh" },
			},
			format_after_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			formatters = {
				prettier = {
					javascript = {
						args = { "--single-quote" },
					},
				},
				autoflake = {
					python = {
						args = { "--remove-all-unused-imports", "--remove-unused-variables" },
					},
				},
				isort = {
					python = {
						args = { "--profile", "black" },
					},
				},
				black = {
					python = {
						args = { "--fast" },
					},
				},
				vala_format = {
					command = "clang-format",
					-- args = { "--assume-filename=.vala" },
				},
			},
		})
	end,
}
