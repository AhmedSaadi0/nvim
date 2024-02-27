---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "chadracula",
	transparency = false,
	statusline = {
		-- separator_style = "round",
		theme = "minimal",
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
