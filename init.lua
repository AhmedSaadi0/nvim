require("configs.options")
require("mappings")

-- Filetype detection for requirements.txt files
vim.filetype.add({
	pattern = {
		["requirements%-3.13%.txt$"] = "requirements",
		["requirements%.txt$"] = "requirements",
	},
})

-- Disable built-in plugins we don't use (nvim-tree handles file explorer)
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

vim.o.ttyfast = true

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

require("lazy").setup("plugins", {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { "tokyonight", "catppuccin" },
	},
})

if vim.g.neovide then
	require("neovide")
end

if vim.loader then
	vim.loader.enable()
end

-- Set all .html files to be treated as htmldjango
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.html",
	callback = function()
		if vim.fn.filereadable("manage.py") == 1 then
			vim.bo.filetype = "htmldjango"
		end
	end,
})
