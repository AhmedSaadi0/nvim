return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "عرض مراجع LSP"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "الانتقال إلى التصريح"
				keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "عرض تعريفات LSP"
				keymap.set("n", "gD", "<cmd:Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "عرض تطبيقات LSP"
				keymap.set("n", "gi", "<cmd:Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "عرض تعريفات نوع LSP"
				keymap.set("n", "gt", "<cmd:Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "عرض الإجراءات المتاحة"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "إعادة تسمية ذكية"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "عرض تشخيصات الملف"
				keymap.set("n", "<leader>D", "<cmd:Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

				opts.desc = "عرض تشخيصات السطر"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "الانتقال إلى التشخيص السابق"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "الانتقال إلى التشخيص التالي"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "عرض التوثيق لما هو تحت المؤشر"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "إعادة تشغيل LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					cmd = { "lua-language-server" },
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT", -- or "Lua 5.1", "Lua 5.2", etc.
								path = vim.split(package.path, ";"),
							},
							diagnostics = {
								globals = { "vim" }, -- Add any global variables you use
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
								misc = {
									parameters = {
										-- "--log-level=trace",
									},
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
									-- enable = false,
									groupSeverity = {
										strong = "Warning",
										strict = "Warning",
									},
									groupFileStatus = {
										["ambiguity"] = "Opened",
										["await"] = "Opened",
										["codestyle"] = "None",
										["duplicate"] = "Opened",
										["global"] = "Opened",
										["luadoc"] = "Opened",
										["redefined"] = "Opened",
										["strict"] = "Opened",
										["strong"] = "Opened",
										["type-check"] = "Opened",
										["unbalanced"] = "Opened",
										["unused"] = "Opened",
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
				})
			end,
			["pyright"] = function()
				lspconfig["pyright"].setup({
					capabilities = capabilities,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "off",
								-- extraPaths = { "/media/linux/projects/hopofy/stable/" },
								useLibraryCodeForTypes = true,
							},
						},
					},
					filetypes = { "python" },
				})
			end,
			["efm"] = function()
				lspconfig["efm"].setup({
					init_options = { documentFormatting = true, codeAction = true },
					settings = {
						rootMarkers = { ".git/" },
						languages = {
							htmldjango = {
								{
									lintCommand = "djlint",
									lintStdin = true,
									-- lintFormats = { "%f:%l:%c: %m" },
									-- formatCommand = "djlint --reformat",
									-- formatStdin = true,
								},
							},
							html = {
								{
									lintCommand = "djlint --lint --quiet",
									lintStdin = true,
									lintFormats = { "%f:%l:%c: %m" },
									formatCommand = "djlint --reformat --quiet",
									formatStdin = true,
								},
							},
							-- Add additional configurations for other filetypes if needed
						},
					},
					filetypes = { "htmldjango", "html" }, -- Add more filetypes if needed
				})
			end,
			["pylsp"] = function()
				lspconfig["pylsp"].setup({
					settings = {
						pylsp = {
							plugins = {
								autopep8 = {
									enabled = false,
								},
								pycodestyle = {
									enabled = true,
									ignore = { "E501", "E231", "W503" },
									maxLineLength = 79,
								},
								pylint = {
									enabled = true,
									executable = "pylint",
									-- using .pylintrc for each project is better
									-- args = {
									-- 	"--disable=C0111",
									-- 	"--enable=W0614",
									-- 	"--load-plugins=pylint_celery,pylint_django",
									-- 	"--django-settings-module=hopofy.settings",
									-- 	"--suggestion-mode=yes",
									-- 	"--function-naming-style=snake_case",
									-- 	"--include-naming-hint=yes",
									-- },
								},
							},
						},
					},
				})
			end,
			["tsserver"] = function()
				lspconfig["tsserver"].setup({
					-- on_attach = on_attach,
					-- capabilities = capabilities,
					init_options = {
						preferences = {
							disableSuggestions = true,
						},
					},
					commands = {
						OrganizeImports = {
							function()
								local params = {
									command = "_typescript.organizeImports",
									arguments = { vim.api.nvim_buf_get_name(0) },
								}
								vim.lsp.buf.execute_command(params)
							end,
							description = "Organize Imports",
						},
					},
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				})
			end,
		})
	end,
}
