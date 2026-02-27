return {
	enabled = true, -- تفعيل الميزة

	-- ⏱️ توقيت العرض
	timeout = 3000, -- اختفاء الإشعار بعد 3 ثوانٍ (0 للإبقاء)
	refresh = 50, -- تحديث الشاشة كل 50مللي ثانية للرسوم المتحركة

	-- 📐 الحجم والموضع
	width = { min = 40, max = 0.4 }, -- عرض الإشعار: من 40 عمود إلى 40% من الشاشة
	height = { min = 1, max = 0.6 }, -- ارتفاع الإشعار: من سطر واحد إلى 60% من الشاشة
	margin = { top = 0, right = 1, bottom = 0 }, -- هامش حول الإشعارات
	padding = true, -- إضافة مسافة داخلية للإشعار
	gap = 0, -- المسافة بين الإشعارات المتعددة

	-- 📊 الترتيب والفلترة
	sort = { "level", "added" }, -- ترتيب حسب الأهمية ثم الوقت
	level = vim.log.levels.TRACE, -- عرض كل المستويات (TRACE, DEBUG, INFO, WARN, ERROR)
	top_down = true, -- ظهور الإشعارات من الأعلى للأسفل

	-- 🎨 الأيقونات
	icons = {
		error = " ",
		warn = " ",
		info = " ",
		debug = " ",
		trace = " ",
	},

	-- 🎭 نمط العرض
	style = "compact", -- أو "fancy" أو "minimal"

	-- 🕐 تنسيق الوقت
	date_format = "%R", -- عرض الوقت بصيغة HH:MM
	more_format = " ↓ %d lines ", -- نص يظهر عند وجود محتوى مخفي

	-- 🧹 دالة لتحديد الإشعارات التي تبقى (لا تختفي تلقائيًا)
	keep = function(notif)
		-- الإبقاء على الإشعارات إذا كان المستخدم يكتب في سطر الأوامر
		return vim.fn.getcmdpos() > 0
	end,

	-- 🚫 فلترة الإشعارات غير المرغوبة (أرجع false لإخفاء إشعار معين)
	filter = function(notif)
		-- مثال: إخفاء إشعارات debug من مصدر معين
		-- if notif.title == "LSP" and notif.level == vim.log.levels.DEBUG then
		--     return false
		-- end
		return true -- إظهار كل الإشعارات افتراضيًا
	end,
}
