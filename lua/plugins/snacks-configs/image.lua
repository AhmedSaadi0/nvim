return {
	enabled = true, -- تفعيل الميزة
	formats = {
		"png",
		"jpg",
		"jpeg",
		"gif",
		"bmp",
		"webp",
		"tiff",
		"heic",
		"avif",
		"mp4",
		"mov",
		"avi",
		"mkv",
		"webm",
		"pdf",
		"icns",
	},
	force = false, -- محاولة العرض حتى لو لم يدعم التيرمينال (قد لا يعمل بشكل صحيح)

	-- ⚙️ إعدادات العرض داخل المستندات (Markdown, HTML, etc.)
	doc = {
		enabled = true, -- تفعيل العرض التلقائي للصور في المستندات
		inline = true, -- عرض الصورة مضمنة داخل النص (بدلاً من نافذة عائمة)
		float = true, -- استخدام نافذة عائمة إذا لم يدعم التيرمينال inline
		max_width = 80, -- أقصى عرض للصورة (بالأعمدة)
		max_height = 40, -- أقصى ارتفاع للصورة (بالأسطر)
		-- إخفاء نص الصورة وعرض أيقونة بدلاً منه (تجريبي)
		conceal = function(lang, type)
			return type == "math" -- إخفاء معادلات الرياضيات فقط
		end,
	},

	-- 📂 مجلدات البحث عن الصور النسبية
	img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },

	-- 🪟 خيارات النافذة التي تعرض الصورة
	wo = {
		wrap = false,
		number = false,
		relativenumber = false,
		cursorcolumn = false,
		signcolumn = "no",
		foldcolumn = "0",
		list = false,
		spell = false,
		statuscolumn = "",
	},

	-- ⚡ خيارات التحويل (يتطلب ImageMagick)
	convert = {
		notify = true, -- إشعار عند حدوث خطأ في التحويل
		magick = {
			default = { "{src}[0]", "-scale", "1920x1080>" }, -- للصور العادية
			pdf = { "-density", 192, "{src}[{page}]", "-background", "white", "-alpha", "remove" }, -- لملفات PDF
		},
	},

	-- 🔢 إعدادات معادلات الرياضيات (LaTeX/Typst)
	math = {
		enabled = true,
		latex = {
			font_size = "Large",
			packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
		},
	},

	-- 🎨 الأيقونات المستخدمة عند إخفاء الصور
	icons = {
		math = "󰪚 ",
		chart = "󰄧 ",
		image = " ",
	},
}
