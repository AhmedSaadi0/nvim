require("configs.options")
require("configs.mappings")

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

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
})

if vim.g.neovide then
	require("neovide")
end

require("current-theme")
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
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
-- vim.opt.linespace = 4

-- Set all .html files to be treated as htmldjango
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.html",
	callback = function()
		vim.cmd("set filetype=htmldjango")
	end,
})
