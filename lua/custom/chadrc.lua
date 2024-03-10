---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "chadracula",
	transparency = false,
	statusline = {
		-- separator_style = "round",
		theme = "default",
		overriden_modules = function(modules)
			table.insert(
				modules,
				4,
				(function()
					local path = vim.fn.expand("%:~:.")
					return " | %#St_LspStatus#" .. path
				end)()
			)
		end,
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
-- opt.autoindent = true
-- opt.smartindent = true

opt.spell = true
opt.spelllang = { "en" } --"ar" }
opt.relativenumber = true

return M
