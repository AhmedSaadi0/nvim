---@type Base46Table
local M = {}

-- UI (Eclipse)
-- الخلفية رمادية فحمية ناعمة (مثل VSCode Dark أو Atom One Dark)
M.base_30 = {
	white = "#abb2bf", -- أبيض مطفي
	black = "#22262e", -- الخلفية الأساسية (رمادي داكن وليس أسود)
	darker_black = "#1b1f25", -- القوائم الجانبية
	black2 = "#2b303b", -- أفتح قليلاً
	one_bg = "#2f3542", -- العناصر النشطة
	one_bg2 = "#383f50",
	one_bg3 = "#40485d",
	grey = "#545862",
	grey_fg = "#686c78",
	grey_fg2 = "#828997",
	light_grey = "#abb2bf",
	red = "#e06c75", -- أحمر ناعم
	baby_pink = "#e06c75",
	pink = "#c678dd",
	line = "#2f3542",
	green = "#98c379", -- أخضر زيتوني فاتح
	vibrant_green = "#b4d89a",
	nord_blue = "#61afef",
	blue = "#61afef", -- أزرق سماوي ناعم
	seablue = "#56b6c2",
	yellow = "#e5c07b", -- أصفر خردلي
	sun = "#ebd09c",
	purple = "#c678dd", -- بنفسجي فاتح
	dark_purple = "#a864bf",
	teal = "#56b6c2",
	orange = "#d19a66",
	cyan = "#56b6c2",
	statusline_bg = "#2b303b",
	lightbg = "#56b6c2",
	pmenu_bg = "#d19a66",
	folder_bg = "#61afef",
}

M.base_16 = {
	base00 = "#22262e", -- الخلفية الرمادية
	base01 = "#2b303b",
	base02 = "#2f3542",
	base03 = "#545862",
	base04 = "#828997",
	base05 = "#abb2bf", -- النص
	base06 = "#e06c75",
	base07 = "#98c379",
	base08 = "#e06c75", -- أحمر
	base09 = "#d19a66", -- برتقالي
	base0A = "#e5c07b", -- أصفر
	base0B = "#98c379", -- أخضر
	base0C = "#56b6c2", -- سماوي
	base0D = "#61afef", -- أزرق
	base0E = "#c678dd", -- بنفسجي
	base0F = "#be5046",
}

M.type = "dark"
M = require("base46").override_theme(M, "eclipse")
return M
