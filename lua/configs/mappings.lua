local map = vim.keymap.set

map("n", ";", ":", { desc = "دخول وضع الاوامر" })

require("configs.mappings.code-actions")
require("configs.mappings.beffers")
require("configs.mappings.editor-actions")
