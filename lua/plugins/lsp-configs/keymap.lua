-- ملف: lua/plugins/lsp-configs/keymap.lua

local keymap = vim.keymap -- for conciseness

local keymapping = {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "عرض مراجع LSP"
		keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "الانتقال إلى التصريح"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "عرض تعريفات LSP"
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		opts.desc = "عرض تطبيقات LSP"
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		opts.desc = "عرض تعريفات نوع LSP"
		keymap.set("n", "gt", "<cmd:Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "عرض الإجراءات المتاحة"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "إعادة تسمية ذكية"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "عرض تشخيصات الملف"
		keymap.set("n", "<leader>D", "<cmd:Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "عرض تشخيصات السطر"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "الانتقال إلى التشخيص السابق"
		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

		opts.desc = "الانتقال إلى التشخيص التالي"
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

		opts.desc = "عرض التوثيق لما هو تحت المؤشر"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "إعادة تشغيل LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

		opts.desc = "اصلاح الاستيراد لبيثون"
		keymap.set("n", "<leader>ii", function()
			if vim.bo.filetype == "python" then
				-- Remove unused imports with autoflake
				vim.cmd(
					"!autoflake --in-place --remove-all-unused-imports "
						.. vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
				)
				-- Organize imports with isort
				vim.cmd("!isort " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
				vim.cmd("edit!")
			end
		end, opts)
	end,
}

return keymapping
