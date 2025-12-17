---@type Base46Table
local M = {}

-- UI (Midnight Forest)
-- خلفية خضراء داكنة جداً مع ألوان ترابية وهادئة
M.base_30 = {
	white = "#d3c6aa", -- أبيض كريمي دافئ
	black = "#1e2326", -- خلفية داكنة مخضرة
	darker_black = "#171d20",
	black2 = "#272e33",
	one_bg = "#2b3339", -- خلفية العناصر النشطة
	one_bg2 = "#323c41",
	one_bg3 = "#3a454a",
	grey = "#505a60",
	grey_fg = "#7a8478",
	grey_fg2 = "#859289",
	light_grey = "#9da9a0",
	red = "#e67e80", -- أحمر هادئ
	baby_pink = "#e69875",
	pink = "#d699b6",
	line = "#2b3339",
	green = "#a7c080", -- أخضر عشبي
	vibrant_green = "#b3d182",
	nord_blue = "#7fbbb3",
	blue = "#7fbbb3", -- أزرق هادئ
	seablue = "#83c092",
	yellow = "#dbbc7f", -- أصفر ذهبي
	sun = "#d699b6",
	purple = "#d699b6",
	dark_purple = "#e67e80",
	teal = "#83c092",
	orange = "#e69875",
	cyan = "#83c092",
	statusline_bg = "#272e33",
	lightbg = "#2b3339",
	pmenu_bg = "#232a2e",
	folder_bg = "#7fbbb3",
}

M.base_16 = {
	base00 = "#1e2326",
	base01 = "#272e33",
	base02 = "#2b3339",
	base03 = "#323c41",
	base04 = "#505a60",
	base05 = "#d3c6aa",
	base06 = "#e67e80",
	base07 = "#a7c080",
	base08 = "#e67e80", -- المتغيرات
	base09 = "#e69875", -- برتقالي دافئ
	base0A = "#dbbc7f", -- أصفر
	base0B = "#a7c080", -- سترينج (أخضر)
	base0C = "#83c092",
	base0D = "#7fbbb3", -- دوال (أزرق باهت)
	base0E = "#d699b6", -- بنفسجي باهت
	base0F = "#9da9a0",
}

M.type = "dark"
M = require("base46").override_theme(M, "midnight_forest")
return M
