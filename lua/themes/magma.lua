---@type Base46Table
local M = {}

-- UI (Magma Theme)
-- ألوان نارية دافئة على خلفية رمادية محايدة
M.base_30 = {
	white = "#f2f4f8",
	black = "#101012", -- رمادي فحمي داكن
	darker_black = "#080809",
	black2 = "#1c1c1f",
	one_bg = "#242429",
	one_bg2 = "#2e2e36",
	one_bg3 = "#3a3a45",
	grey = "#52525e",
	grey_fg = "#656575",
	grey_fg2 = "#7e7e91",
	light_grey = "#9a9ab0",
	red = "#ff4a4a", -- أحمر قوي
	baby_pink = "#ff7bad",
	pink = "#ff5e95",
	line = "#242429",
	green = "#85e89d",
	vibrant_green = "#42f587",
	nord_blue = "#79b8ff",
	blue = "#79b8ff",
	seablue = "#39c5bb",
	yellow = "#ffea70", -- أصفر ساطع
	sun = "#ffbd2e",
	purple = "#b392f0",
	dark_purple = "#9e77e8",
	teal = "#39c5bb",
	orange = "#ff9f1c", -- برتقالي ناري
	cyan = "#56d8ff",
	statusline_bg = "#1c1c1f",
	lightbg = "#242429",
	pmenu_bg = "#161618",
	folder_bg = "#ff9f1c",
}

M.base_16 = {
	base00 = "#101012",
	base01 = "#1c1c1f",
	base02 = "#242429",
	base03 = "#52525e",
	base04 = "#656575",
	base05 = "#f2f4f8",
	base06 = "#ffffff",
	base07 = "#ffea70",
	base08 = "#ff4a4a", -- أحمر للأخطاء
	base09 = "#ff9f1c", -- برتقالي للأرقام
	base0A = "#ffea70", -- أصفر للكلاسات
	base0B = "#85e89d", -- أخضر للنصوص
	base0C = "#39c5bb",
	base0D = "#79b8ff", -- أزرق للدوال
	base0E = "#b392f0", -- بنفسجي للكلمات المحجوزة
	base0F = "#f2f4f8",
}

M.polish_hl = {
	defaults = {
		CursorLineNr = { fg = M.base_30.orange, bold = true }, -- رقم السطر الحالي برتقالي
	},
}

M.type = "dark"
M = require("base46").override_theme(M, "magma")
return M
