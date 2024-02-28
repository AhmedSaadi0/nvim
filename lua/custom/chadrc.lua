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

return M
