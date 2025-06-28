require("configs.options")
require("configs.mappings")

-- Filetype detection for requirements.txt files
vim.filetype.add({
	pattern = {
		["requirements%-3.13%.txt$"] = "requirements",
		["requirements%.txt$"] = "requirements",
	},
})

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { "nvchad" },
	},
})

-- (method 1, For heavy lazyloaders)
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

if vim.g.neovide then
	require("neovide")
end
-- require("current-theme")
vim.o.ttyfast = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
-- vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- Set all .html files to be treated as htmldjango
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.html",
	callback = function()
		if vim.fn.filereadable("manage.py") == 1 then
			vim.bo.filetype = "htmldjango"
			-- vim.cmd("set filetype=htmldjango")
		end
	end,
})
--

-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		-- إغلاق جميع النوافذ العائمة (Floating Windows)
-- 		for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 			if vim.api.nvim_win_get_config(win).relative ~= "" then
-- 				vim.api.nvim_win_close(win, true)
-- 			end
-- 		end
-- 	end,
-- })

-- local navic = require("nvim-navic")
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
