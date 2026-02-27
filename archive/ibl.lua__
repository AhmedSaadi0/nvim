-- Import necessary modules
local hooks = require("ibl.hooks")

-- Define highlight groups with a mix of dim/muted colors
local highlight_groups = {
	{ name = "IndentSymbolDimBlue", fg = "#6185a6" },
	{ name = "IndentSymbolDimYellow", fg = "#d8a657" },
	{ name = "IndentSymbolDimCyan", fg = "#569a9e" },
	{ name = "IndentSymbolDimOrange", fg = "#c77f6b" },
	{ name = "IndentSymbolDimGreen", fg = "#879967" },
	{ name = "IndentSymbolDimRed", fg = "#b1626a" },
	{ name = "IndentSymbolDimPurple", fg = "#967bb6" },
}

-- Register highlight setup hook (لا تغيير هنا)
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for _, group in ipairs(highlight_groups) do
		vim.api.nvim_set_hl(0, group.name, { fg = group.fg })
	end
end)

require("ibl").setup({
	indent = {
		-- نستخدم قائمة الألوان القاتمة الجديدة
		highlight = vim.tbl_map(function(group)
			return group.name
		end, highlight_groups),
		-- يمكنك تغيير شكل الخط هنا إذا أردت
		-- char = "▏",
	},
	whitespace = {
		-- نستخدم نفس القائمة للمسافات البيضاء
		highlight = vim.tbl_map(function(group)
			return group.name
		end, highlight_groups),
		remove_blankline_trail = true,
	},
	scope = {
		enabled = true,
		show_start = true,
		show_end = true,
		char = "│", -- غيرت الحرف إلى خط عمودي أوضح
		-- نجعل لون النطاق مميزًا باستخدام اللون الأرجواني القاتم
		highlight = { "IndentSymbolDimPurple" },
	},
})

-- Register scope highlight hook (لا تغيير هنا)
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
