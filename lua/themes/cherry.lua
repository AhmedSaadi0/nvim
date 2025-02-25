-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understand properties, fields, and what highlightings the color is used for
---@type Base46Table
local M = {}

-- UI (Cherry Theme)
M.base_30 = {
	white = "#dedeff",
	black = "#1f1f2a", -- background
	darker_black = "#181822", -- slightly darker
	black2 = "#252533", -- slightly lighter
	one_bg = "#2a2a38",
	one_bg2 = "#323240",
	one_bg3 = "#3a3a48",
	grey = "#43435a",
	grey_fg = "#53536b",
	grey_fg2 = "#64647a",
	light_grey = "#73738a",
	red = "#ff568e",
	baby_pink = "#ff69a2",
	pink = "#ff69a2",
	line = "#2a2a38",
	green = "#64de83",
	vibrant_green = "#73de8a",
	nord_blue = "#73a9ff",
	blue = "#73a9ff",
	seablue = "#62c6da",
	yellow = "#efff73",
	sun = "#f3ff85",
	purple = "#946ff7",
	dark_purple = "#a481f7",
	teal = "#71c2d9",
	orange = "#ff69a2",
	cyan = "#62c6da",
	statusline_bg = "#252533",
	lightbg = "#2a2a38",
	pmenu_bg = "#ff568e",
	folder_bg = "#42A5F5",
}

-- Base16 colors
M.base_16 = {
	base00 = "#1f1f2a",
	base01 = "#252533",
	base02 = "#2a2a38",
	base03 = "#323240",
	base04 = "#3a3a48",
	base05 = "#bdc3df",
	base06 = "#dedeff",
	base07 = "#ebebff",
	base08 = "#ff568e",
	base09 = "#ff69a2",
	base0A = "#efff73",
	base0B = "#64de83",
	base0C = "#62c6da",
	base0D = "#73a9ff",
	base0E = "#946ff7",
	base0F = "#ff69a2",
}

-- OPTIONAL: Custom highlights
M.polish_hl = {
	defaults = {
		Comment = {
			fg = M.base_30.grey_fg2,
			italic = true,
		},
	},
	treesitter = {
		["@variable"] = { fg = M.base_30.red },
	},
}

-- Theme type
M.type = "dark" -- or "light"

-- Allow user overrides
M = require("base46").override_theme(M, "cherry")

return M
