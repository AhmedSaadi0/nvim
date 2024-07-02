return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local noice = require("noice")

		-- Configure Lualine with theme colors
		lualine.setup({
			options = {
				globalstatus = true,
				theme = "auto", -- Automatically use colors from the current theme
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } }, -- Show full path
				lualine_x = {
					{
						noice.api.status.mode.get,
						cond = noice.api.status.mode.has,
					},
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
