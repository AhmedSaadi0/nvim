return {
	"rebelot/heirline.nvim",
	config = function()
		local navic = require("nvim-navic")
		local utils = require("heirline.utils")

		-- Fallback to Neovim's highlight groups for colors
		local function get_hl_color(hl_group, attr)
			local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
			return string.format("#%06x", hl[attr] or 0x39CE76)
		end

		local colors = {
			bg = get_hl_color("NormalFloat", "foreground"), -- Fallback to "Normal" fg
			fg = get_hl_color("NormalFloat", "background"), -- Fallback to "StatusLine" bg
			separator = get_hl_color("Comment", "foreground"), -- Use "Comment" color for separators
		}

		-- Define the Navic Winbar
		local NavicWinbar = {
			condition = function()
				return navic.is_available()
			end,
			provider = function()
				return navic.get_location()
			end,
			hl = function()
				return {
					fg = colors.fg,
					bg = colors.bg,
					-- bold = true,
				}
			end,
			update = "CursorMoved",
		}

		-- Define a separator for styling
		local WinbarSeparator = {
			provider = " > ",
			hl = { fg = colors.separator, bg = colors.bg },
		}

		-- Fallback when Navic is unavailable
		local FallbackWinbar = {
			provider = function()
				return " "
			end,
			hl = { fg = colors.separator, bg = colors.bg },
		}

		-- Set up the Winbar
		require("heirline").setup({
			winbar = {
				utils.insert(NavicWinbar, FallbackWinbar),
				WinbarSeparator,
			},
		})
	end,
}
