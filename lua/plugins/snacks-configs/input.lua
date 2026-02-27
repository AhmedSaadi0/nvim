return {
	enabled = true, -- تفعيل الميزة
	icon = " ", -- أيقونة تظهر قبل حقل الإدخال
	icon_hl = "SnacksInputIcon", -- مجموعة الألوان للأيقونة
	icon_pos = "left", -- مكان الأيقونة: "left" أو "right" أو false لإخفائها
	prompt_pos = "title", -- مكان نص السؤال: "title" (في عنوان النافذة) أو "left"

	-- 🪟 تخصيص شكل النافذة العائمة
	win = {
		style = "input", -- نمط مخصص لـ snacks
		width = 60, -- عرض النافذة
		height = 1, -- ارتفاع حقل الإدخال
		relative = "editor", -- التمركز بالنسبة للمحرر (أو "cursor" للقرب من المؤشر)
		row = 2, -- المسافة من الأعلى
		border = "rounded", -- شكل الإطار: "none", "single", "rounded", "shadow"
		backdrop = false, -- خلفية ضبابية (تتطلب دعم التيرمينال)
		title_pos = "center", -- مكان عنوان النافذة
	},

	expand = true, -- السماح بتوسيع الحقل تلقائيًا عند الكتابة الطويلة
}
