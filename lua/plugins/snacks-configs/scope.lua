return {
	enabled = true, -- تفعيل الميزة

	-- 📏 حجم النطاق
	min_size = 2, -- أقل حجم للنطاق (سطرين كحد أدنى)
	max_size = nil, -- لا حد أقصى افتراضياً

	-- 🎯 طريقة الكشف
	cursor = true, -- استخدام عمود المؤشر لتحديد النطاق الدقيق
	edge = true, -- تضمين الحواف (السطر السابق والتالي ذو المسافة الأقل)
	siblings = false, -- توسيع النطاق ليشمل الإخوة في حال كان سطراً واحداً

	-- ⚡ الأداء
	debounce = 30, -- تأخير بالمللي ثانية لتجنب التحديث المستمر أثناء الكتابة
	filter = function(buf)
		-- تفعيل فقط في الملفات العادية (ليس في terminal أو help)
		return vim.bo[buf].buftype == "" and vim.b[buf].snacks_scope ~= false
	end,

	-- 🌳 إعدادات Treesitter
	treesitter = {
		enabled = true, -- استخدام Treesitter للكشف الدقيق
		injections = true, -- دعم اللغات المدمجة (مثل JS داخل Vue/HTML)
		blocks = {
			enabled = false, -- تفعيل لتحديد كتل معينة فقط (functions, classes, etc.)
			-- "function_declaration",
			-- "function_definition",
			-- "class_declaration",
			-- "if_statement",
			-- "for_statement",
		},
		field_blocks = {
			"local_declaration",
		},
	},

	-- ⌨️ اختصارات لوحة المفاتيح
	keys = {
		-- 📝 كائنات نصية (Text Objects)
		textobject = {
			ii = {
				min_size = 2,
				edge = false, -- النطاق الداخلي (بدون الحواف)
				cursor = false,
				treesitter = { blocks = { enabled = false } },
				desc = "نطاق داخلي",
			},
			ai = {
				min_size = 2,
				edge = true, -- النطاق الكامل (مع الحواف)
				cursor = false,
				treesitter = { blocks = { enabled = false } },
				desc = "نطاق كامل",
			},
		},

		-- 🦘 قفز (Jump Navigation)
		jump = {
			["[i"] = {
				min_size = 1,
				bottom = false, -- القفز للأعلى
				edge = true,
				desc = "القفز لبداية النطاق",
			},
			["]i"] = {
				min_size = 1,
				bottom = true, -- القفز للأسفل
				edge = true,
				desc = "القفز لنهاية النطاق",
			},
		},
	},
}
