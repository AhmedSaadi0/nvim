return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				-- "treesitter", -- Comment out less efficient providers
				-- "regex",     -- Comment out less efficient providers
			},
			delay = 300, -- Increase delay for performance
			filetype_overrides = {},
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
				-- Add more file types as needed
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			providers_regex_syntax_denylist = {},
			providers_regex_syntax_allowlist = {},
			under_cursor = false, -- Disable illumination under the cursor
			large_file_cutoff = 5000, -- Set a cutoff for large files (number of lines)
			large_file_overrides = {
				delay = 500, -- Increase delay for large files
				under_cursor = false, -- Disable illumination under the cursor for large files
				min_count_to_highlight = 2, -- Increase min count to highlight for large files
			},
			min_count_to_highlight = 1,
			should_enable = function(bufnr)
				return true
			end,
			case_insensitive_regex = false,
		})
	end,
}
