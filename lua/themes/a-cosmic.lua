-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understand properties, fields, and what highlightings the color is used for
---@type Base46Table
local M = {}

-- UI (Cosmic Void Theme)
-- ثيم "الفراغ الكوني": خلفية سوداء عميقة مع ألوان نيون
M.base_30 = {
	white = "#e0e6ed", -- نص أساسي فاتح
	black = "#0b0c15", -- الخلفية الأساسية (داكنة جداً)
	darker_black = "#06070a", -- أغمق قليلاً للقوائم الجانبية
	black2 = "#141620", -- افتح قليلاً
	one_bg = "#191c2b", -- خلفية للعناصر النشطة
	one_bg2 = "#212538",
	one_bg3 = "#2a2e45",
	grey = "#454b63", -- للتعليقات والعناصر غير النشطة
	grey_fg = "#5b6382",
	grey_fg2 = "#717ba1",
	light_grey = "#8a94b8",
	red = "#ff4f78", -- أحمر نيون للأخطاء
	baby_pink = "#ff7eb6",
	pink = "#f778ba",
	line = "#191c2b", -- لون خط الفاصل
	green = "#50fa7b", -- أخضر مريح
	vibrant_green = "#69ff94",
	nord_blue = "#6db3ce",
	blue = "#bd93f9", -- أزرق مائل للبنفسجي
	seablue = "#8be9fd", -- سماوي
	yellow = "#f1fa8c", -- أصفر باهت
	sun = "#ffb86c", -- برتقالي/ذهبي
	purple = "#bd93f9", -- بنفسجي
	dark_purple = "#9670d9",
	teal = "#8be9fd",
	orange = "#ffb86c",
	cyan = "#8be9fd",
	statusline_bg = "#141620", -- خلفية شريط الحالة
	lightbg = "#bd93f9",
	pmenu_bg = "#ab86e2", -- خلفية القوائم المنبثقة
	folder_bg = "#bd93f9", -- لون المجلدات
}

-- Base16 colors (تستخدم لتلوين الكود - Syntax Highlighting)
M.base_16 = {
	base00 = "#0b0c15", -- الخلفية
	base01 = "#141620",
	base02 = "#191c2b",
	base03 = "#454b63",
	base04 = "#5b6382",
	base05 = "#e0e6ed", -- النص الأساسي
	base06 = "#f8f8f2",
	base07 = "#ffffff",
	base08 = "#ff5555", -- متغيرات/أخطاء (أحمر)
	base09 = "#ffb86c", -- أرقام/ثوابت (برتقالي)
	base0A = "#f1fa8c", -- كلاسات/أنواع (أصفر)
	base0B = "#50fa7b", -- نصوص String (أخضر)
	base0C = "#8be9fd", -- (سماوي)
	base0D = "#bd93f9", -- دوال Functions (بنفسجي)
	base0E = "#ff79c6", -- كلمات مفتاحية Keywords (زهري)
	base0F = "#6272a4",
}

-- OPTIONAL: Custom highlights
-- تعديلات إضافية لتمييز الكود بشكل أفضل
M.polish_hl = {
	defaults = {
		Comment = {
			fg = M.base_30.grey_fg2, -- لون التعليقات رمادي مزرق
			italic = true, -- جعل التعليقات مائلة
		},
		["@keyword"] = {
			fg = M.base_30.baby_pink, -- الكلمات المفتاحية باللون الزهري
			bold = true,
		},
		["@function"] = {
			fg = M.base_30.seablue, -- الدوال باللون السماوي
			bold = true,
		},
	},
	treesitter = {
		["@variable"] = { fg = "#e0e6ed" }, -- المتغيرات باللون الأبيض لتقليل الضجيج
		["@variable.builtin"] = { fg = M.base_30.red }, -- المتغيرات المدمجة بالأحمر
	},
}

-- Theme type
M.type = "dark"

-- Allow user overrides
M = require("base46").override_theme(M, "cosmic")

return M
