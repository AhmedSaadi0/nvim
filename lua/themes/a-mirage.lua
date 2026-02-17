---@type Base46Table
local M = {}

-- UI (Mirage)
-- خلفية دافئة مائلة للبني الرمادي
M.base_30 = {
	white = "#cccac2", -- أبيض دافئ (كريمي)
	black = "#262727", -- رمادي ترابي
	darker_black = "#1f1f1f",
	black2 = "#303030",
	one_bg = "#323434",
	one_bg2 = "#3d3f3f",
	one_bg3 = "#474949",
	grey = "#5c5e5e",
	grey_fg = "#757878",
	grey_fg2 = "#8a8d8d",
	light_grey = "#a8a8a8",
	red = "#f07178",
	baby_pink = "#f29668",
	pink = "#dba6f0",
	line = "#323434",
	green = "#aad94c", -- أخضر تفاحي
	vibrant_green = "#c5f07a",
	nord_blue = "#59c2ff",
	blue = "#39bae6",
	seablue = "#59c2ff",
	yellow = "#ffb454", -- كهرماني
	sun = "#ffcc66",
	purple = "#d2a6ff",
	dark_purple = "#a37acc",
	teal = "#95e6cb",
	orange = "#ff8f40",
	cyan = "#95e6cb",
	statusline_bg = "#1f1f1f",
	lightbg = "#d2a6ff",
	pmenu_bg = "#95e6cb",
	folder_bg = "#ffb454",
}

M.base_16 = {
	base00 = "#262727", -- الخلفية
	base01 = "#323434",
	base02 = "#3d3f3f",
	base03 = "#5c5e5e",
	base04 = "#8a8d8d",
	base05 = "#cccac2",
	base06 = "#f29668",
	base07 = "#ffb454",
	base08 = "#f07178", -- أحمر
	base09 = "#ff8f40", -- برتقالي
	base0A = "#ffb454", -- أصفر
	base0B = "#aad94c", -- أخضر
	base0C = "#95e6cb", -- سماوي مخضر
	base0D = "#39bae6", -- أزرق
	base0E = "#d2a6ff", -- بنفسجي
	base0F = "#5c5e5e",
}

M.type = "dark"
M = require("base46").override_theme(M, "mirage")
return M
