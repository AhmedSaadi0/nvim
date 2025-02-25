local navic = require("nvim-navic")

local pylsp_configs = {
	settings = {
		pylsp = {
			plugins = {
				-- تعطيل autopep8 لتفادي تنسيق الكود تلقائيًا (يمكنك استخدام Black خارجيًا)
				autopep8 = { enabled = false },
				-- تفعيل pycodestyle مع تجاهل بعض التحذيرات (مثل طول السطر وأخطاء المسافات)
				pycodestyle = {
					enabled = true,
					ignore = { "E501", "E231", "W503" },
					maxLineLength = 79,
				},
				-- تفعيل pylint مع تحديد بعض الخيارات (يمكن تعديل المعلمات حسب الحاجة)
				pylint = {
					enabled = true,
					executable = "pylint",
					-- args = { "--enable=W0611,W0614" },
					args = { "--disable=C0114,C0115,C0116", "--enable=W0611,W0614" },
				},
				-- يمكنك إضافة إعدادات إضافية هنا إذا رغبت:
				-- مثال:
				-- jedi_completion = { enabled = true, include_params = true },
				-- pyls_isort = { enabled = true },
				-- mccabe = { enabled = false },
			},
		},
	},
	-- دالة on_attach لتفعيل الميزات عند ربط السيرفر مع البفر الحالي
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
		-- إضافة اختصارات مفاتيح شائعة لخدمات الـ LSP (يمكن تعديلها حسب تفضيلاتك)
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	end,
	-- بعض الإعدادات الإضافية لتحسين استجابة التغييرات في النص
	flags = {
		debounce_text_changes = 150,
	},
}

return pylsp_configs
