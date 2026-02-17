-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understand properties, fields, and what highlightings the color is used for
---@type Base46Table
local M = {}

-- UI (Cherry Theme)
M.base_30 = {
	white = "#dedeff",
	black = "#1b1b2f", -- background
	darker_black = "#131321", -- slightly darker
	black2 = "#0e0e19", -- slightly lighter
	one_bg = "#2a2a38",
	one_bg2 = "#323240",
	one_bg3 = "#3a3a48",
	grey = "#4d4d5f",
	grey_fg = "#43435a",
	grey_fg2 = "#64647a",
	light_grey = "#73738a",
	red = "#ff568e",
	baby_pink = "#FD02FF",
	pink = "#A609AF",
	line = "#2a2a38",
	green = "#64de83",
	vibrant_green = "#73de8a",
	nord_blue = "#73a9ff",
	blue = "#73a9ff",
	seablue = "#62c6da",
	yellow = "#efff73",
	sun = "#f3ff85",
	purple = "#946ff7",
	dark_purple = "#2BF6E0",
	teal = "#f4176f",
	orange = "#d9f429",
	cyan = "#26ee66",
	statusline_bg = "#ff3c15",
	lightbg = "#1da5ff",
	pmenu_bg = "#22b9ff",
	folder_bg = "#22e3d3",
}

-- Base16 colors
M.base_16 = {
	base00 = "#1b1b2f",
	base01 = "#282846",
	base02 = "#282846",
	base03 = "#323240",
	base04 = "#3a3a48",
	base05 = "#bdc3df",
	base06 = "#dedeff",
	base07 = "#ebebff",
	base08 = "#2BF6E0",
	base09 = "#f4176f",
	base0A = "#d9f429",
	base0B = "#26ee66",
	base0C = "#ffaaff",
	base0D = "#1ab6ff",
	base0E = "#ffa361",
	base0F = "#22e3d3",
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
M = require("base46").override_theme(M, "cherry-midnight")

return M
