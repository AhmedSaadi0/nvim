vim.opt.laststatus = 3

local options = {

	base46 = {
		theme = "bearded-arc", -- default theme
		hl_add = {},
		-- hl_override = {
		--           Function = { "blue", "red", 20 }
		--       },
		integrations = {},
		changed_themes = {},
		transparency = false,
		-- theme_toggle = { "bearded-arc", "bearded-arc" },
	},

	ui = {
		cmp = {
			-- icons_left = true, -- only for non-atom styles!
			lspkind_text = true,
			style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
			format_colors = {
				tailwind = true, -- will work for css lsp too
				-- icon = "󱓻",
			},
		},

		telescope = { style = "bordered" }, -- borderless / bordered

		statusline = {
			enabled = false,
			theme = "vscode", -- default/vscode/vscode_colored/minimal
			-- default/round/block/arrow separators work only for default statusline theme
			-- round and block will work for minimal theme only

			separator_style = "block",
			-- separator_style = "arrow",
			order = {
				"mode",
				"file",
				"git", --[[ "path", ]]
				"%=",
				"lsp_msg",
				"%=",
				"diagnostics",
				"lsp",
				"cwd",
				"cursor",
			},
			modules = {
				file = function()
					local icon = " 󰈚 "
					local path = vim.fn.expand("%:~:.")
					return "%#PmenuKindSel#" .. icon .. path .. " %#Normal#"
				end,
				cursor = function()
					local current_line = vim.fn.line(".")
					local total_lines = vim.fn.line("$")
					return string.format("Ln %d/%d", current_line, total_lines)
				end,
			},
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = true,
			-- lazyload = false,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
			bufwidth = 21,
		},
	},

	lsp = { signature = false, focus_on_open = false },

	cheatsheet = {
		enabled = false,
		theme = "grid", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},

	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
}

return options
