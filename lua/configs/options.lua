-- Encoding and Script Settings
vim.scriptencoding = "utf-8" -- Still valid for script encoding [[1]]
vim.opt.encoding = "utf-8" -- Core encoding for Neovim [[3]]
vim.opt.fileencoding = "utf-8" -- File-specific encoding [[3]]

-- UI and Behavior
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- Retained for legacy compatibility
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.wrap = false
-- vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.backspace = "indent,eol,start"
-- vim.opt.path:append({ "**" }) -- Search subdirectories recursively
vim.opt.path:append("**")
vim.opt.mouse = ""
vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.clipboard = "unnamedplus" -- X11 clipboard integration

-- Shell and Leader Keys
vim.opt.shell = "/usr/bin/fish"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modern Additions
vim.opt.signcolumn = "yes" -- Always show sign column (for LSP/Diagnostic icons)
vim.opt.updatetime = 50 -- Faster updates for CursorHold, etc.
vim.opt.timeoutlen = 500 -- Reduce mapping timeout
vim.opt.undofile = true -- Persistent undo history
vim.opt.colorcolumn = "88" -- Visual line length guide (from your `linelength` [[7]]
vim.opt.wildmenu = true -- Enhanced command-line completion
-- vim.opt.lazyredraw = true -- Better performance during macros
vim.opt.termguicolors = true -- True color support for terminals
