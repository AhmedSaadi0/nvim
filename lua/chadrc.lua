local M = {}

M.ui = {
	theme = "oxocarbon",
	statusline = {
		-- theme = "minimal",
		separator_style = "block",
		-- separator_style = "arrow",
		order = {
			"mode",
			"file",
			"git", --[[ "path", ]]
			"%=",
			"lsp_msg",
			"%=",
			"diagnostics",
			"lsp",
			"cwd",
			"cursor",
		},
		modules = {
			file = function()
				local icon = " 󰈚 "
				local path = vim.fn.expand("%:~:.")
				return "%#PmenuKindSel#" .. icon .. path .. " %#Normal#"
			end,
		},
	},
}

local opt = vim.opt

-- opt.tabstop = 4
-- opt.softtabstop = 4
-- opt.shiftwidth = 4
-- opt.shiftround = false
-- opt.expandtab = true
-- opt.autoindent = true
-- opt.smartindent = true

opt.spell = true
opt.spelllang = { "en" } --"ar" }
opt.relativenumber = true

return M
