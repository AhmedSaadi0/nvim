return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.code_actions.gomodifytags,

				-- null_ls.builtins.diagnostics.pylint.with({
				-- 	-- هنا نضع نفس الإعدادات التي كانت لديك في pylsp
				-- 	-- هذا يخبر pylint بتجاهل بعض الأخطاء وتفعيل أخرى
				-- 	extra_args = { "--disable=C0301,C0114,C0115,C0116", "--enable=W0611,W0614" },
				-- 	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				-- }),
			},
		})
	end,
}
