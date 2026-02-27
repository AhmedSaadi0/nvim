-- lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy", -- تحميل متأخر لأسرع startup
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- 🎨 دالة لاستخراج لون من Highlight Group ديناميكياً
		local function get_hl_color(group, attr)
			local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
			if attr == "fg" then
				return hl.fg and string.format("#%06x", hl.fg) or nil
			elseif attr == "bg" then
				return hl.bg and string.format("#%06x", hl.bg) or nil
			end
			return nil
		end

		-- 🎨 دالة لبناء ثيم ديناميكي يعتمد على الألوان النشطة
		local function get_dynamic_theme()
			-- نستخدم Normal للون النص والخلفية الأساسي
			local normal_fg = get_hl_color("Normal", "fg") or "#ffffff"
			local normal_bg = get_hl_color("Normal", "bg") or "#000000"

			-- نستخدم StatusLine للوضع النشط
			local statusline_fg = get_hl_color("StatusLine", "fg") or normal_fg
			local statusline_bg = get_hl_color("StatusLine", "bg") or "#444444"

			-- نستخدم StatusLineNC للوضع غير النشط
			local statusline_nc_bg = get_hl_color("StatusLineNC", "bg") or "#222222"

			-- ألوان الأوضاع المختلفة (نستخلصها من highlight groups الخاصة بـ Neovim)
			local mode_colors = {
				normal = {
					a = { fg = normal_bg, bg = get_hl_color("Keyword", "fg") or "#569CD6", gui = "bold" },
					b = { fg = statusline_fg, bg = statusline_bg },
					c = { fg = normal_fg, bg = normal_bg },
				},
				insert = {
					a = { fg = normal_bg, bg = get_hl_color("String", "fg") or "#6A9955", gui = "bold" },
					b = { fg = statusline_fg, bg = statusline_bg },
					c = { fg = normal_fg, bg = normal_bg },
				},
				visual = {
					a = { fg = normal_bg, bg = get_hl_color("Constant", "fg") or "#B5CEA8", gui = "bold" },
					b = { fg = statusline_fg, bg = statusline_bg },
					c = { fg = normal_fg, bg = normal_bg },
				},
				replace = {
					a = { fg = normal_bg, bg = get_hl_color("Error", "fg") or "#F44747", gui = "bold" },
					b = { fg = statusline_fg, bg = statusline_bg },
					c = { fg = normal_fg, bg = normal_bg },
				},
				command = {
					a = { fg = normal_bg, bg = get_hl_color("Function", "fg") or "#DCDCAA", gui = "bold" },
					b = { fg = statusline_fg, bg = statusline_bg },
					c = { fg = normal_fg, bg = normal_bg },
				},
				inactive = {
					a = { fg = "#888888", bg = statusline_nc_bg },
					b = { fg = "#888888", bg = statusline_nc_bg },
					c = { fg = "#888888", bg = normal_bg },
				},
			}

			return {
				normal = mode_colors.normal,
				insert = mode_colors.insert,
				visual = mode_colors.visual,
				replace = mode_colors.replace,
				command = mode_colors.command,
				inactive = mode_colors.inactive,
				tabline = {
					a = mode_colors.normal.a,
					b = mode_colors.normal.b,
					c = mode_colors.normal.c,
				},
				extensions = {},
			}
		end

		-- ⚙️ إعداد Lualine
		lualine.setup({
			options = {
				globalstatus = true, -- شريط حالة واحد في أسفل الشاشة
				theme = get_dynamic_theme(), -- 🎯 الثيم الديناميكي
				component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "dashboard", "snacks_dashboard" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						padding = { left = 1, right = 1 },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1, -- مسار نسبي
						symbols = {
							modified = "●",
							readonly = "󰌾",
							unnamed = "[No Name]",
						},
						padding = { left = 1, right = 1 },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						padding = { left = 1, right = 1 },
					},
					{
						"filetype",
						icon_only = false,
						padding = { left = 1, right = 1 },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = get_hl_color("WarningMsg", "fg") or "#ff9e64" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_y = {
					{
						"progress",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
							if #clients == 0 then
								return "󰅖 No LSP"
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return " " .. table.concat(names, ",")
						end,
						padding = { left = 1, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", file_status = true, path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "lazy", "fugitive", "nvim-tree" },
		})
	end,
}
