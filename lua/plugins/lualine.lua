return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		-- local noice = require("noice")

		local vibrant_m3_palette = {
			bg = "#1A1B26", -- Deep dark blue background
			fg = "#F4F4F4", -- Off-white text color
			primary = "#63B1EA", -- Deep Purple (Primary)
			secondary = "#E1C07B", -- Teal (Secondary)
			tertiary = "#E06C75", -- Deep Orange (Tertiary)
			error = "#D32F2F", -- Red (Error color)
			surface = "#2A2E37", -- Dark surface for inactive parts
			on_surface = "#FFFFFF", -- White text for inactive surfaces
			on_primary = "#FFFFFF", -- White text on primary color
			on_secondary = "#000000", -- Black text on secondary color
			on_error = "#FFFFFF", -- White text on error color
			background = "#121212", -- Dark background for inactive sections
			success = "#F89888", -- Green for success
			info = "#0288D1", -- Blue for info
			warning = "#FF9800", -- Amber for warning
			accent = "#9C27B0", -- Purple accent
		}

		local vibrant_m3_theme = {
			normal = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.primary, gui = "bold" }, -- Primary mode (Deep Purple)
				b = { fg = vibrant_m3_palette.on_primary, bg = vibrant_m3_palette.surface }, -- Section background
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg }, -- Text on background
			},
			insert = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.secondary, gui = "bold" }, -- Insert mode (Teal)
				b = { fg = vibrant_m3_palette.on_secondary, bg = vibrant_m3_palette.surface }, -- Section background
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg }, -- Text in insert mode
			},
			visual = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.tertiary, gui = "bold" }, -- Visual mode (Deep Orange)
				b = { fg = vibrant_m3_palette.on_primary, bg = vibrant_m3_palette.surface }, -- Section background
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg }, -- Text in visual mode
			},
			replace = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.error, gui = "bold" }, -- Replace mode (Red)
				b = { fg = vibrant_m3_palette.on_error, bg = vibrant_m3_palette.surface }, -- Section background
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg }, -- Text in replace mode
			},
			command = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.success, gui = "bold" }, -- Command mode (Green)
				b = { fg = vibrant_m3_palette.on_primary, bg = vibrant_m3_palette.surface }, -- Section background
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg }, -- Text in command mode
			},
			inactive = {
				a = { fg = vibrant_m3_palette.on_surface, bg = vibrant_m3_palette.surface }, -- Inactive sections (Light text on dark surface)
				b = { fg = vibrant_m3_palette.on_surface, bg = vibrant_m3_palette.surface },
				c = { fg = vibrant_m3_palette.on_surface, bg = vibrant_m3_palette.bg },
			},
			tabline = {
				a = { fg = vibrant_m3_palette.bg, bg = vibrant_m3_palette.primary, gui = "bold" },
				b = { fg = vibrant_m3_palette.on_primary, bg = vibrant_m3_palette.surface },
				c = { fg = vibrant_m3_palette.fg, bg = vibrant_m3_palette.bg },
			},
			extensions = {},
		}

		-- Configure Lualine with theme colors
		lualine.setup({
			options = {
				globalstatus = true,
				theme = vibrant_m3_theme, -- Use the defined custom theme			theme = "auto", -- Automatically use colors from the current theme
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } }, -- Show full path
				lualine_x = {
					-- {
					-- 	noice.api.status.mode.get,
					-- 	cond = noice.api.status.mode.has,
					-- },
					{ "diagnostics", sources = { "nvim_lsp" } }, -- Adding diagnostics from LSP
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" }, -- Keeping the custom color for updates
					},
					-- "encoding",
					-- "fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{
						function()
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return "No LSP"
							end
							local names = {}
							for _, client in pairs(clients) do
								table.insert(names, client.name)
							end
							return table.concat(names, ",")
						end,
						icon = " LSP:",
					},
				},
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 1 } }, -- Show full path
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
