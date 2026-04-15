return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- استخدام أحدث إصدار مستقر
	dependencies = {
		"folke/snacks.nvim", -- التكامل مع نافذة الأوامر التي تملكها بالفعل
	},
	config = function()
		-- إعداد الخيارات الأساسية
		vim.g.opencode_opts = {
			-- يمكنك تفعيل الـ LSP التجريبي إذا أردت
			-- lsp = { enabled = true }
		}

		-- ضروري جداً لكي يتم تحديث الملفات تلقائياً عند تعديلها من الوكيل
		vim.o.autoread = true

		-- ===========================
		-- اختصارات لوحة المفاتيح
		-- ===========================

		-- فتح نافذة لسؤال الوكيل (الذكاء الاصطناعي) وإرسال السياق الحالي
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask OpenCode about this" })

		-- فتح قائمة (Picker) للوصول إلى مهام الوكيل المختلفة
		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			require("opencode").select()
		end, { desc = "Execute OpenCode action" })

		-- إظهار / إخفاء واجهة OpenCode
		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
			require("opencode").toggle()
		end, { desc = "Toggle OpenCode UI" })
	end,
}
