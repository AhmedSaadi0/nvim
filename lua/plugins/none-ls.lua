return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.code_actions.gomodifytags,
			},
		})
	end,
}
