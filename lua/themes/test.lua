-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understand properties, fields, and what highlightings the color is used for
---@type Base46Table
local M = {}

-- UI
-- UI
M.base_30 = {
	white = "#f0f0f6", -- Slight shift from #f0f0f5 [[2]]
	black = "#1e1e2b", -- Slight shift from #1e1e2a [[2]]
	darker_black = "#181824",
	black2 = "#242430",
	one_bg = "#2c2c38",
	line = "#2e2e3a",
	one_bg2 = "#343440",
	one_bg3 = "#3c3c48",
	grey = "#5a5a6a",
	grey_fg = "#707080",
	grey_fg2 = "#8a8a9a",
	light_grey = "#a0a0b0",
	red = "#ff4a68",
	baby_pink = "#f28c8c",
	pink = "#ff6ec2",
	green = "#5cd68a",
	vibrant_green = "#70e091",
	nord_blue = "#6cb3ff",
	blue = "#5aa3ff",
	seablue = "#5f87af",
	yellow = "#e6c24d",
	sun = "#fff380",
	purple = "#b85eff",
	dark_purple = "#9a4dff",
	teal = "#4db5b5",
	orange = "#ff8c33",
	cyan = "#4dffff",
	statusline_bg = "#2a2a38",
	lightbg = "#343440",
	pmenu_bg = "#5dabff",
	folder_bg = "#4fb7b7",
}

-- Base16 colors (now all unique)
M.base_16 = {
	base00 = "#1f1f2a", -- Slight shift from #1e1e2a [[2]]
	base01 = "#242431", -- Slight shift from #242430
	base02 = "#2c2c39", -- Slight shift from #2c2c38
	base03 = "#343441", -- Slight shift from #343440
	base04 = "#5a5a6b", -- Slight shift from #5a5a6a
	base05 = "#a0a0b1", -- Slight shift from #a0a0b0
	base06 = "#f1f1f5", -- Slight shift from #f0f0f5 [[2]]
	base07 = "#ffffff",
	base08 = "#ff4a69", -- Slight shift from #ff4a68
	base09 = "#ff8c34", -- Slight shift from #ff8c33
	base0A = "#e6c24e", -- Slight shift from #e6c24d
	base0B = "#5cd68b", -- Slight shift from #5cd68a
	base0C = "#b85eff", -- Slight shift from #4db5b5
	base0D = "#5aa3fe", -- Slight shift from #5aa3ff
	base0E = "#4db5b6", -- No change (unique)
	base0F = "#f28c8d", -- Slight shift from #f28c8c
}

-- OPTIONAL: Custom highlights
M.polish_hl = {
	defaults = {
		Comment = {
			fg = M.base_30.grey_fg2,
			italic = true, -- تعليقات مائلة بلون رمادي فاتح
		},
	},
	treesitter = {
		["@variable"] = { fg = M.base_30.purple }, -- متغيرات بلون بنفسجي متوسط
	},
}

-- Theme type
M.type = "dark" -- or "light"

-- Allow user overrides
M = require("base46").override_theme(M, "test")

return M
