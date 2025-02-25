-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understand properties, fields, and what highlightings the color is used for
---@type Base46Table
local M = {}

-- UI
M.base_30 = {
	white = "#ffffff",
	black = "#181818", -- usually your theme bg
	darker_black = "#141414", -- 6% darker than black
	black2 = "#1e1e1e", -- 6% lighter than black
	one_bg = "#282828", -- 10% lighter than black
	one_bg2 = "#303030", -- 6% lighter than one_bg
	one_bg3 = "#383838", -- 6% lighter than one_bg2
	grey = "#4e4e4e", -- 40% lighter than black
	grey_fg = "#5e5e5e", -- 10% lighter than grey
	grey_fg2 = "#6e6e6e", -- 5% lighter than grey
	light_grey = "#7e7e7e",
	red = "#ff5f5f",
	baby_pink = "#ff8686",
	pink = "#ffafaf",
	line = "#303030", -- 15% lighter than black
	green = "#5fff5f",
	vibrant_green = "#87ff87",
	nord_blue = "#87afff",
	blue = "#5fafff",
	seablue = "#5f87af",
	yellow = "#ffff5f",
	sun = "#ffff87",
	purple = "#af5fff",
	dark_purple = "#875faf",
	teal = "#5f8787",
	orange = "#ff875f",
	cyan = "#5fffff",
	statusline_bg = "#1e1e1e",
	lightbg = "#262626",
	pmenu_bg = "#5fafff",
	folder_bg = "#5f8787",
}

-- Base16 colors
M.base_16 = {
	base00 = "#181818",
	base01 = "#202020",
	base02 = "#282828",
	base03 = "#303030",
	base04 = "#3a3a3a",
	base05 = "#c6c6c6",
	base06 = "#e4e4e4",
	base07 = "#ffffff",
	base08 = "#ff5f5f",
	base09 = "#ff875f",
	base0A = "#ffff87",
	base0B = "#5fff5f",
	base0C = "#5fffff",
	base0D = "#5fafff",
	base0E = "#af5fff",
	base0F = "#ff5f87",
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
		["@variable"] = { fg = M.base_30.blue },
	},
}

-- Theme type
M.type = "dark" -- or "light"

-- Allow user overrides
M = require("base46").override_theme(M, "chocolate")

return M
