-- ملف: lua/plugins/refactoring.lua

return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	-- تحميل الإضافة فقط عند فتح ملفات من هذه الأنواع لتحسين الأداء
	ft = { "python", "lua", "go", "java", "c", "cpp" },
	config = function()
		require("refactoring").setup({
			-- الإعدادات التي تفضلها
			prompt_func_return_type = { python = false, go = false, java = false },
			prompt_func_param_type = { python = false, go = false, java = false },

			-- الإعدادات الأساسية لـ Python
			print_var_statements = {
				python = 'print(f"{var_name} = {var}")',
			},
			printf_statements = {
				python = 'print("DEBUG: L{line}")',
			},
		})

		-- تعيين الاختصارات بعد تحميل الإعدادات (النسخة المصححة)
		-- تم دمج الإعدادات مباشرة في كل استدعاء
	end,
}
