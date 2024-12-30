return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"Jezda1337/nvim-html-css",
		"ray-x/lsp_signature.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local signature = require("lsp_signature")

		signature.setup({
			bind = true,
			handler_opts = { border = "single" },
			hint_enable = false, -- disable virtual text hints if you only want the popup
			always_trigger = true,
		})

		require("luasnip.loaders.from_vscode").load()
		require("luasnip.loaders.from_lua").load({ paths = { "./lua/snippets" } })

		local function is_in_function_params()
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]
			-- Check if the character before the cursor is '(' or ','
			return string.sub(line, col - 1, col - 1) == "(" or string.sub(line, col - 1, col - 1) == ","
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Up>"] = function(fallback)
					fallback() -- Allow normal behavior if the menu is not visible
				end,
				["<Down>"] = function(fallback)
					fallback() -- Allow normal behavior if the menu is not visible
				end,
				["<C-l>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "buffer", priority = 8 },
				{ name = "path", priority = 7 },
				{ name = "luasnip", priority = 6 },
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					maxwidth = 100,
					ellipsis_char = "...",
				}),
				expandable_indicator = true,
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.score,
					cmp.config.compare.exact,
					cmp.config.compare.locality,
					cmp.config.compare.scopes,
					cmp.config.compare.offset,
					cmp.config.compare.recently_used,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			window = {
				documentation = {
					border = "single",
					winhighlight = "NormalFloat:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
					enabled = function()
						return not is_in_function_params()
					end,
				},
			},
		})
	end,
}
