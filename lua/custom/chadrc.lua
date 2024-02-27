---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "chadracula",
	transparency = true,
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

-- M.config = function()
--   vim.opt_local.spell = true
--   vim.opt_local.spelllang = "en_us"
-- end

vim.opt.spell = true
vim.opt.spelllang = { "en" } --"ar" }
vim.opt.relativenumber = true

return M
