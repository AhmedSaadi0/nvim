return {
	"rebelot/heirline.nvim",
	config = function()
		local navic = require("nvim-navic")
		local utils = require("heirline.utils")

		-- Function to adjust brightness (e.g., lighten/darken a color)
		local function adjust_brightness(color, factor)
			local r = math.min(255, math.max(0, bit.rshift(color, 16) + factor))
			local g = math.min(255, math.max(0, bit.band(bit.rshift(color, 8), 0xFF) + factor))
			local b = math.min(255, math.max(0, bit.band(color, 0xFF) + factor))
			return string.format("#%02x%02x%02x", r, g, b)
		end

		-- Function to get highlight colors dynamically with fallbacks
		local function get_hl_color(hl_group, attr, fallback)
			local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
			local color = hl[attr] or fallback
			return color
		end

		-- Function to fetch colors for the winbar
		local function get_colors()
			local editor_bg = get_hl_color("Normal", "PmenuSbar", 0x1E1E1E)
			local editor_fg = get_hl_color("Normal", "foreground", 0xFFFFFF)
			local contrast_bg = adjust_brightness(editor_bg, -30) -- Darken editor background

			return {
				fg = editor_fg,
				bg = contrast_bg,
				separator = get_hl_color("Comment", "foreground", 0xAAAAAA), -- Use "Comment" color for separators
			}
		end

		-- Dynamic Winbar configuration
		local NavicWinbar = {
			condition = function()
				return navic.is_available()
			end,
			provider = function()
				return navic.get_location()
			end,
			hl = function()
				local colors = get_colors()
				return {
					fg = colors.fg,
					bg = colors.bg, -- Ensure distinct background
				}
			end,
			update = "CursorMoved",
		}

		local WinbarSeparator = {
			provider = " > ",
			hl = function()
				local colors = get_colors()
				return {
					fg = colors.separator,
					bg = colors.bg,
				}
			end,
		}

		local FallbackWinbar = {
			provider = function()
				return " "
			end,
			hl = function()
				local colors = get_colors()
				return {
					fg = colors.separator,
					bg = colors.bg,
				}
			end,
		}

		-- Set up Heirline
		require("heirline").setup({
			winbar = {
				utils.insert(NavicWinbar, FallbackWinbar),
				WinbarSeparator,
			},
		})

		-- Reconfigure on colorscheme change
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				require("heirline").setup({
					winbar = {
						utils.insert(NavicWinbar, FallbackWinbar),
						WinbarSeparator,
					},
				})
			end,
		})
	end,
}
