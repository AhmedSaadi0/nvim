-- ~/.config/nvim/lua/custom/plugins.lua
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
				-- Ensure djlint runs first, then djhtml
				htmldjango = { "djlint", "djhtml" },
				bash = { "beautysh" },
			},
			format_after_save = {
				lsp_fallback = true,
				timeout_ms = 10000,
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
				-- Add the djlint formatter
				djlint = {
					command = "djlint",
					args = { "--reformat", "$FILENAME" },
				},
				-- Add the djhtml formatter
				djhtml = {
					command = "djhtml",
					args = { "$FILENAME" },
				},
			},
		})
	end,
}
