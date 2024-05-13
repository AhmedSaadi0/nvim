require("nvchad.options")

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.mouse = ""

-- opt.tabstop = 4
-- opt.softtabstop = 4
-- opt.shiftwidth = 4
-- opt.shiftround = false
-- opt.expandtab = true
-- opt.autoindent = true
-- opt.smartindent = true

vim.opt.spell = true
vim.opt.spelllang = { "en_us" } --"ar" }
vim.opt.relativenumber = true

vim.opt.shell = "/usr/bin/fish"
