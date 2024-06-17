-- Import necessary modules
local hooks = require("ibl.hooks")

-- Define highlight groups with a mix of vibrant colors
local highlight_groups = {
	{ name = "IndentSymbolRed", fg = "#FF6B6B" },
	{ name = "IndentSymbolOrange", fg = "#FFA726" },
	{ name = "IndentSymbolYellow", fg = "#FFD54F" },
	{ name = "IndentSymbolGreen", fg = "#66BB6A" },
	{ name = "IndentSymbolBlue", fg = "#42A5F5" },
	{ name = "IndentSymbolPurple", fg = "#AB47BC" },
	{ name = "IndentSymbolCyan", fg = "#26C6DA" },
}

-- Register highlight setup hook
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for _, group in ipairs(highlight_groups) do
		vim.api.nvim_set_hl(0, group.name, { fg = group.fg })
	end
end)

local highlight = {
	-- "IndentSymbolRed",
	-- "IndentSymbolOrange",
	-- "IndentSymbolYellow",
	-- "IndentSymbolGreen",
	-- "IndentSymbolBlue",
	-- "IndentSymbolPurple",
	-- "IndentSymbolCyan",
}
-- Configuration for the indent-blankline plugin with different symbols
require("ibl").setup({
	indent = {
		char = { "│" }, -- Characters to use for indentation
		highlight = vim.tbl_map(function(group)
			return group.name
		end, highlight_groups),
	},
	whitespace = {
		-- Uncomment the following line if you want to highlight whitespace
		-- highlight = space_highlight,
		remove_blankline_trail = false,
		-- highlight = highlight,
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
		highlight = "IndentSymbolPurple", -- Use the purple color for scope highlight
	},
})

-- Register scope highlight hook
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
