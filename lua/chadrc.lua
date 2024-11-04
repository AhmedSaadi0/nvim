vim.opt.laststatus = 3

local options = {

	base46 = {
		theme = "jabuti", -- default theme
		hl_add = {},
		hl_override = {},
		integrations = {},
		changed_themes = {},
		transparency = false,
		theme_toggle = { "jabuti", "jabuti" },
	},

	ui = {
		cmp = {
			icons_left = false, -- only for non-atom styles!
			lspkind_text = true,
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
			format_colors = {
				tailwind = false, -- will work for css lsp too
				icon = "󱓻",
			},
		},

		telescope = { style = "bordered" }, -- borderless / bordered

		statusline = {
			enabled = true,
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
			},
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = false,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
		},
	},

	lsp = { signature = false },

	cheatsheet = {
		enabled = false,
		theme = "grid", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},

	mason = { pkgs = {} },

	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
}

return options
