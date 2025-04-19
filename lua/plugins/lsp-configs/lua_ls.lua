local lua_ls_config = {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- or the version you need
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				completion = {
					workspaceWord = true,
					callSnippet = "Both",
				},
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
				doc = {
					privateName = { "^_" },
				},
				type = {
					castNumberToInteger = true,
				},
				diagnostics = {
					disable = { "incomplete-signature-doc", "trailing-space" },
					groupSeverity = {
						strong = "Warning",
						strict = "Warning",
					},
					groupFileStatus = {
						ambiguity = "Opened",
						await = "Opened",
						codestyle = "None",
						duplicate = "Opened",
						global = "Opened",
						luadoc = "Opened",
						redefined = "Opened",
						strict = "Opened",
						strong = "Opened",
						["type-check"] = "Opened",
						unbalanced = "Opened",
						unused = "Opened",
					},
					unusedLocalExclude = { "_*" },
				},
				format = {
					enable = false,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
						continuation_indent_size = "2",
					},
				},
			},
		},
	},
}

return lua_ls_config
