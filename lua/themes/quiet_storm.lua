---@type Base46Table
local M = {}

-- UI (Quiet Storm)
-- خلفية زرقاء رمادية (مثل لون الغيوم ليلاً)
M.base_30 = {
	white = "#c0caf5",
	black = "#24283b", -- أزرق ليلي متوسط (ليس أسود)
	darker_black = "#1f2335",
	black2 = "#2e344f",
	one_bg = "#292e42",
	one_bg2 = "#3b4261",
	one_bg3 = "#414868",
	grey = "#565f89",
	grey_fg = "#737aa2",
	grey_fg2 = "#787c99",
	light_grey = "#9aa5ce",
	red = "#f7768e",
	baby_pink = "#ff9e64",
	pink = "#bb9af7",
	line = "#292e42",
	green = "#9ece6a",
	vibrant_green = "#b9f27c",
	nord_blue = "#7aa2f7",
	blue = "#7aa2f7",
	seablue = "#7dcfff",
	yellow = "#e0af68",
	sun = "#ffc777",
	purple = "#9d7cd8",
	dark_purple = "#bb9af7",
	teal = "#7dcfff",
	orange = "#ff9e64",
	cyan = "#7dcfff",
	statusline_bg = "#1f2335",
	lightbg = "#292e42",
	pmenu_bg = "#1f2335",
	folder_bg = "#7aa2f7",
}

M.base_16 = {
	base00 = "#24283b", -- الخلفية العاصفة
	base01 = "#1f2335",
	base02 = "#292e42",
	base03 = "#565f89",
	base04 = "#787c99",
	base05 = "#c0caf5",
	base06 = "#a9b1d6",
	base07 = "#c0caf5",
	base08 = "#f7768e",
	base09 = "#ff9e64",
	base0A = "#e0af68",
	base0B = "#9ece6a",
	base0C = "#7dcfff",
	base0D = "#7aa2f7",
	base0E = "#bb9af7",
	base0F = "#9aa5ce",
}

M.type = "dark"
M = require("base46").override_theme(M, "quiet_storm")
return M
