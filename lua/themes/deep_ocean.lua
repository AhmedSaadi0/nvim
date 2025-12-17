---@type Base46Table
local M = {}

-- UI (Deep Ocean)
-- خلفية زرقاء عميقة جداً (Navy) مع ألوان زاهية
M.base_30 = {
	white = "#c0caf5",
	black = "#0f111a", -- كحلي قريب للسواد
	darker_black = "#090b10",
	black2 = "#1a1e2e",
	one_bg = "#1f2335",
	one_bg2 = "#292e42",
	one_bg3 = "#3b4261",
	grey = "#444b6a",
	grey_fg = "#565f89",
	grey_fg2 = "#787c99",
	light_grey = "#a9b1d6",
	red = "#f7768e",
	baby_pink = "#ff007c",
	pink = "#bb9af7",
	line = "#1f2335",
	green = "#9ece6a",
	vibrant_green = "#73daca",
	nord_blue = "#7aa2f7",
	blue = "#7aa2f7",
	seablue = "#0db9d7",
	yellow = "#e0af68",
	sun = "#ffc777",
	purple = "#9d7cd8",
	dark_purple = "#7aa2f7",
	teal = "#1abc9c",
	orange = "#ff9e64",
	cyan = "#7dcfff",
	statusline_bg = "#1a1e2e",
	lightbg = "#292e42",
	pmenu_bg = "#16161e",
	folder_bg = "#7aa2f7",
}

M.base_16 = {
	base00 = "#0f111a",
	base01 = "#1a1e2e",
	base02 = "#1f2335",
	base03 = "#444b6a",
	base04 = "#565f89",
	base05 = "#c0caf5",
	base06 = "#a9b1d6",
	base07 = "#dcdeed",
	base08 = "#f7768e", -- أحمر
	base09 = "#ff9e64", -- برتقالي
	base0A = "#e0af68", -- أصفر
	base0B = "#9ece6a", -- أخضر
	base0C = "#7dcfff", -- سماوي
	base0D = "#7aa2f7", -- أزرق
	base0E = "#bb9af7", -- بنفسجي
	base0F = "#c0caf5",
}

M.polish_hl = {
	treesitter = {
		["@constructor"] = { fg = M.base_30.orange },
		["@tag"] = { fg = M.base_30.red },
	},
}

M.type = "dark"
M = require("base46").override_theme(M, "deep_ocean")
return M
