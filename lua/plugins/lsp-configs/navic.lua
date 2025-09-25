-- ملف: lua/plugins/lsp-configs/navic.lua
-- نسخة مُنقّحة: تعرض فقط scope كنص عادي في الـ winbar، وتلوّن البار بخلفية أغمق قليلاً
local M = {}

local function setup_winbar_highlight()
	-- دالة مساعدة للحصول على لون من مجموعة تمييز
	local function get_hl_color(group, which)
		local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
		if not ok or not hl then
			return nil
		end
		local c = (which == "fg") and hl.foreground or hl.background
		if c then
			return string.format("#%06x", c)
		end
		return nil
	end

	-- الخلفية من LineNr
	local bg = get_hl_color("LineNr", "bg") or "#1f2330" -- قيمة احتياطية إذا لم توجد
	-- الخط من StatusLine
	local fg = get_hl_color("StatusLineNC", "fg") or "#c8c8c8"

	-- ضبط مجموعة التمييز NavicWinbar
	pcall(vim.api.nvim_set_hl, 0, "NavicWinbar", { bg = bg, fg = fg, bold = false })
end

function M.setup()
	local ok, navic = pcall(require, "nvim-navic")
	if not ok then
		vim.notify("[navic] nvim-navic not found", vim.log.levels.WARN)
		return
	end

	navic.setup({
		icons = {
			File = "󰈙 ",
			Module = " ",
			Namespace = "󰌗 ",
			Package = " ",
			Class = "𝓒 ",
			Method = "󰊕 ",
			Property = "󰆨 ",
			Field = " ",
			Constructor = " ",
			Enum = "󰕘",
			Interface = "󰕘",
			Function = "󰊕 ",
			Variable = " ",
			Constant = "󰏿 ",
			String = "󰀬 ",
			Number = "󰎠 ",
			Boolean = " ",
			Array = "󰅪 ",
			Object = "󰅩 ",
			Key = "󰌋 ",
			Null = "󰟢 ",
			EnumMember = " ",
			Struct = "󰌗 ",
			Event = " ",
			Operator = "󰆕 ",
			TypeParameter = "󰊄 ",
		},
		-- نوقف output الخاص بالـ statusline-highlighting لنتلقى نصًا عاديًا
		lsp = { auto_attach = true },
		highlight = false,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
		safe_output = true,
		lazy_update_context = false,
		click = false,
		format_text = function(text)
			return text
		end,
	})

	-- حضّر لون الخلفية
	setup_winbar_highlight()

	-- دالة عالمية آمنة تُستدعى من الـ winbar عبر v:lua
	_G.NavicLocation = function()
		local ok2, navic_mod = pcall(require, "nvim-navic")
		if not ok2 then
			return ""
		end
		-- navic_mod.is_available() يعتمد على document symbols وإرفاق navic في on_attach
		if navic_mod.is_available() then
			local loc = navic_mod.get_location()
			return loc or ""
		end
		return ""
	end

	-- ضع الـ winbar: نُطبق مجموعة NavicWinbar كخلفية، ونستدعي النتيجة كنص عادي
	-- لا نستخدم %! لتجنّب مشاكل التحليل؛ لأن get_location الآن لا يولّد رموز تمييز statusline
	vim.o.winbar = "%#NavicWinbar#%{v:lua.NavicLocation()}%#Normal#"
end

function M.on_attach(client, bufnr)
	local ok, navic = pcall(require, "nvim-navic")
	if not ok then
		return
	end
	if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	-- إعادة تلوين الـ winbar في حال تغيّر الثيم أو تم تهيئة نافذة جديدة
	setup_winbar_highlight()
end

return M
