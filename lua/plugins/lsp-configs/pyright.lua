-- ملف: lua/plugins/lsp-configs/pyright.lua
local navic = require("nvim-navic")

local pyright_config = {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- يمكنك تغييره إلى "strict" للمزيد من الصرامة
				useLibraryCodeForTypes = true,
				autoSearchPaths = true, -- يساعد pyright في اكتشاف المكتبات تلقائيًا
				diagnosticSeverityOverrides = {
					reportMissingImports = "warning", -- تخفيض شدة بعض التشخيصات
					reportUnusedVariable = "information",
				},
			},
		},
	},
	filetypes = { "python" },
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
	end,
}

local function is_django_project()
	return vim.fn.glob("manage.py") ~= ""
end

-- إذا كان المشروع من نوع Django، يتم تعطيل فحص الأنواع الكامل
if is_django_project() then
	pyright_config.settings.python.analysis.typeCheckingMode = "off"
end

return pyright_config
