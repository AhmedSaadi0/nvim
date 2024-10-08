-- options.lua
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.mouse = ""
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.shell = "/usr/bin/fish"

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.clipboard = "unnamedplus"
