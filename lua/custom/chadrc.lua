---@type ChadrcConfig
local M = {}
M.ui = { theme = "bearded-arc" }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

-- M.config = function()
--   vim.opt_local.spell = true
--   vim.opt_local.spelllang = "en_us"
-- end

return M
