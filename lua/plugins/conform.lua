return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
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
				-- html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				htmldjango = { "djlint" },
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
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 10000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}