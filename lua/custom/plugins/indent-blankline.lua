return {
	"lukas-reineke/indent-blankline.nvim",
	-- main = "ibl",
	opts = function(_)
		local function reduce_color_strength(color)
			-- Reduce the color intensity by multiplying each channel value by a factor
			local reduced_color = "#"
				.. color:sub(2):gsub("%x%x", function(c)
					local value = tonumber(c, 16)
					local reduced_value = math.floor(value * 1)
					return string.format("%02x", reduced_value)
				end)

			return reduced_color
		end -- Retrieve original foreground colors

		local string_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("String")), "fg", "gui")
		local function_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Function")), "fg", "gui")
		local keyword_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Keyword")), "fg", "gui")
		local type_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Type")), "fg", "gui")
		local constant_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Constant")), "fg", "gui")
		local error_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Error")), "fg", "gui")

		-- Reduce color strength
		local reduced_string_fg = reduce_color_strength(string_fg)
		local reduced_function_fg = reduce_color_strength(function_fg)
		local reduced_keyword_fg = reduce_color_strength(keyword_fg)
		local reduced_type_fg = reduce_color_strength(type_fg)
		local reduced_constant_fg = reduce_color_strength(constant_fg)
		local reduced_error_fg = reduce_color_strength(error_fg)

		-- Apply reduced colors to your configuration
		local colors = {
			reduced_string_fg,
			reduced_function_fg,
			reduced_keyword_fg,
			reduced_type_fg,
			reduced_constant_fg,
			-- reduced_error_fg,
		}

		-- vim.cmd(
		-- 	[[highlight IndentBlanklineIndent1 guifg=]]
		-- 		.. reduced_string_fg
		-- 		.. [[ guibg=]]
		-- 		.. reduced_string_fg
		-- 		.. [[ gui=nocombine]]
		-- )
		-- vim.cmd(
		-- 	[[highlight IndentBlanklineIndent2 guifg=]]
		-- 		.. reduced_function_fg
		-- 		.. [[ guibg=]]
		-- 		.. reduced_function_fg
		-- 		.. [[ gui=nocombine]]
		-- )
		-- vim.cmd(
		-- 	[[highlight IndentBlanklineIndent3 guifg=]]
		-- 		.. reduced_keyword_fg
		-- 		.. [[ guibg=]]
		-- 		.. reduced_keyword_fg
		-- 		.. [[ gui=nocombine]]
		-- )
		--
		-- require("indent_blankline").setup({
		-- 	-- char = "▎",
		-- 	char_highlight_list = {
		-- 		"IndentBlanklineIndent1",
		-- 		"IndentBlanklineIndent2",
		-- 		"IndentBlanklineIndent3",
		-- 	},
		-- 	space_char_highlight_list = {
		-- 		"IndentBlanklineIndent1",
		-- 		"IndentBlanklineIndent2",
		-- 		"IndentBlanklineIndent3",
		-- 	},
		-- 	-- show_trailing_blankline_indent = false,
		-- 	color_transparency = 0.05,
		-- })

		local hl_list = {}
		for i, color in pairs(colors) do
			local name = "IndentBlanklineIndent" .. i
			vim.api.nvim_set_hl(0, name, { fg = color })
			table.insert(hl_list, name)
		end

		local highlight = {
			"CursorColumn",
			"Whitespace",
		}
		require("indent_blankline").setup({
			char_highlight_list = hl_list,
			-- space_char_highlight_list = hl_list,
			--
			indent = { highlight = highlight, char = "" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		})
	end,
}
