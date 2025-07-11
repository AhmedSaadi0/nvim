-- ملف: lua/plugins/lsp-configs/pylsp.lua

local pylsp_config = {
	settings = {
		pylsp = {
			plugins = {
				-- تعطيل autopep8 لتفادي التنسيق التلقائي
				autopep8 = { enabled = false },
				-- إعداد pycodestyle لتجاهل بعض التحذيرات وتحديد طول السطر
				pycodestyle = {
					enabled = true,
					ignore = { "E501", "E231", "W503" },
					maxLineLength = 88, -- متوافق مع تنسيق Black الشائع
				},
				-- إعداد pylint للتحليل القواعدي مع تعطيل بعض التحذيرات غير المرغوب فيها
				pylint = {
					enabled = true,
					executable = "pylint",
					args = { "--disable=C0301,C0114,C0115,C0116", "--enable=W0611,W0614" },
				},
				-- تفعيل jedi_completion لتحسين الإكمال التلقائي وعرض معلمات الدوال
				jedi_completion = {
					enabled = false, -- Set this to false
					-- include_params = true, -- This won't matter now
				},
				-- Add these if your pylsp version might have them as separate
				-- (though disabling jedi_completion often handles all of them)
				jedi_definition = { enabled = false },
				jedi_hover = { enabled = false },
				jedi_references = { enabled = false },
				jedi_rename = { enabled = false },
				jedi_symbols = { enabled = false },
				-- تفعيل pyls_isort لترتيب الاستيرادات تلقائيًا
				pyls_isort = {
					enabled = true,
				},
				-- تعطيل mccabe لمراقبة التعقيد (يمكن تفعيله إذا رغبت)
				mccabe = {
					enabled = false,
				},
			},
		},
	},
	filetypes = { "python" },
	on_attach = function(client, bufnr)
		-- local opts = { noremap = true, silent = true }
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	end,
	flags = {
		debounce_text_changes = 150,
	},
}

return pylsp_config
