local map = vim.keymap.set

map("n", ";", ":", { desc = "دخول وضع الاوامر" })

require("configs.mappings.code-actions")
require("configs.mappings.buffers")
require("configs.mappings.editor-actions")
require("configs.mappings.search")
