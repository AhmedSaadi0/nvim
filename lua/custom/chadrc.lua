---@type ChadrcConfig
local M = {}
M.ui = { theme = "palenight" }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

vim.g.python3_host_prog = "/media/linux/projects/hopofy/stable/.venv/bin/python"

-- M.config = function()
--   vim.opt_local.spell = true
--   vim.opt_local.spelllang = "en_us"
-- end

return M
