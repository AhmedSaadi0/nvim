return {
	enabled = true, -- تفعيل الميزة

	-- ⏱️ الأداء
	debounce = 200, -- الانتظار 200ms قبل التحديث (يمنع التأخير أثناء الكتابة السريعة)

	-- 🔔 الإشعارات
	notify_jump = false, -- عدم إظهار إشعار عند القفز (لتقليل التشويش)
	notify_end = true, -- إظهار إشعار عند الوصول لآخر مرجع

	-- 📂 سلوك التنقل
	foldopen = true, -- فتح الطيات تلقائياً عند القفز لمرجع بداخلها
	jumplist = true, -- إضافة نقطة في سجل القفزات (للعودة بـ Ctrl+o)

	-- ⌨️ الأوضاع التي تعمل فيها
	-- أنصح بـ {"n"} فقط لتجنب تشتيت الانتباه أثناء الكتابة
	modes = { "n" },

	-- 🚫 فلترة الملفات
	filter = function(buf)
		return vim.g.snacks_words ~= false and vim.b[buf].snacks_words ~= false
	end,
}
