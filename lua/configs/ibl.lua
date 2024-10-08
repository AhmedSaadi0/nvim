-- Import necessary modules
local hooks = require("ibl.hooks")

-- Define highlight groups with a mix of vibrant colors
local highlight_groups = {
	{ name = "IndentSymbolBlue", fg = "#42A5F5" },
	{ name = "IndentSymbolYellow", fg = "#FFD54F" },
	{ name = "IndentSymbolCyan", fg = "#26C6DA" },
	{ name = "IndentSymbolOrange", fg = "#FFA726" },
	{ name = "IndentSymbolGreen", fg = "#66BB6A" },
	{ name = "IndentSymbolRed", fg = "#FF6B6B" },
	{ name = "IndentSymbolPurple", fg = "#AB47BC" },
}

-- Register highlight setup hook
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for _, group in ipairs(highlight_groups) do
		vim.api.nvim_set_hl(0, group.name, { fg = group.fg })
	end
end)

require("ibl").setup({
	indent = {
		-- char = { "│" }, -- Characters to use for indentation
		highlight = vim.tbl_map(function(group)
			return group.name
		end, highlight_groups),
		smart_indent_cap = true,
		repeat_linebreak = true,
	},
	whitespace = {
		highlight = vim.tbl_map(function(group)
			return group.name
		end, highlight_groups),
		remove_blankline_trail = true,
	},
	scope = {
		enabled = true,
		show_start = true,
		show_end = true,
		char = "ǀ",
		-- highlight = spaceHighlight, -- Use the purple color for scope highlight
	},
})

-- Register scope highlight hook
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
