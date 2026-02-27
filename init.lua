-- 1. تفعيل محمل Lua لتسريع الإقلاع (يجب أن يكون في السطر الأول)
if vim.loader then
	vim.loader.enable()
end

-- 2. تعطيل إضافات Neovim الافتراضية غير المستخدمة لتسريع الإقلاع
local default_plugins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchparen",
	"matchit",
	"tarPlugin",
	"gzip",
	"zipPlugin",
	"2html_plugin",
	"shada_plugin",
	"spellfile_plugin",
	"tutor_mode_plugin",
}
for _, plugin in ipairs(default_plugins) do
	vim.g["loaded_" .. plugin] = 1
end

-- 3. تحميل الخيارات الأساسية
require("configs.options")
vim.opt.termguicolors = true -- تفعيل الألوان الحقيقية (لا حاجة للتحقق منها في الإصدارات الحديثة)

-- 4. التعرف على صيغ الملفات (تم دمج النمط ليشمل أي ملف يبدأ أو يحتوي على requirements)
vim.filetype.add({
	pattern = {
		[".*requirements.*%.txt$"] = "requirements",
	},
})

-- 5. إعداد Lazy.nvim و NvChad Themes
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
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	install = { colorscheme = { "nvchad" } },
})

-- تحميل الثيمات بشكل آمن (التحقق من وجود المجلد أولاً لتجنب الأخطاء عند التثبيت لأول مرة)
if vim.fn.isdirectory(vim.g.base46_cache) == 1 then
	for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
		dofile(vim.g.base46_cache .. v)
	end
end

-- 6. إعدادات Neovide
if vim.g.neovide then
	require("neovide")
end

-- 7. تحميل الاختصارات
require("configs.mappings")

-- 8. الأحداث التلقائية (Autocmds)
-- إنشاء مجموعة لتجنب تكرار الحدث عند إعادة تحميل الإعدادات
local augroup = vim.api.nvim_create_augroup("CustomConfig", { clear = true })

-- تحديد نوع الملف كـ htmldjango إذا كان مشروع Django
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup,
	pattern = "*.html",
	callback = function()
		-- البحث عن manage.py في المجلد الحالي والمجلدات الأب (صعوداً)
		if vim.fn.findfile("manage.py", ".;") ~= "" then
			vim.bo.filetype = "htmldjango"
		end
	end,
})
