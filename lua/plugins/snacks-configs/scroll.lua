return {
	enabled = true,

	-- 🎬 حركة التمرير العادية (عند الضغط مرة واحدة)
	animate = {
		-- مدة الحركة: كلما زاد الرقم زادت النعومة (بالمللي ثانية)
		-- step: الحد الأدنى للحركة الصغيرة
		-- total: الحد الأقصى للحركة الكبيرة (مثل PageDown)
		duration = { step = 15, total = 250 },

		easing = "linear",
	},

	-- ⚡ حركة التمرير المتكرر (عند الاستمرار بالضغط أو عجلة الماوس)
	-- يجب أن تكون أسرع قليلاً لتجنب الشعور بالكسل أثناء التمرير السريع
	animate_repeat = {
		delay = 100, -- الانتظار قبل تفعيل وضع التكرار
		duration = { step = 8, total = 120 }, -- أسرع من الحركة العادية
		easing = "linear",
	},

	-- 📋 فلترة الملفات (تفعيل في الملفات العادية وتعطيل في التيرمينال)
	filter = function(buf)
		return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= "terminal"
	end,
}
