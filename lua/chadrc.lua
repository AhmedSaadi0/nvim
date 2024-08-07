local M = {}

M.ui = {

	hl_override = {
		CursorLine = {
			-- bg = "#ffffff",
		},
		CursorColumn = {
			-- bg = "#ffffff",
		},
	},
	theme = "chadracula",
	statusline = {
		theme = "vscode_colored",
		-- theme = "minimal",
		-- separator_style = "block",
		separator_style = "round",
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
}

return M
