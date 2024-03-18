local settings = {
	"kyazdani42/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 50, -- Set your desired default width here
			},
			update_focused_file = {
				enable = true, -- Enable this to have the file highlighted
				update_cwd = true, -- This will update the cwd to the file's directory
				ignore_list = {}, -- Files to ignore (leave empty if you don't want to ignore any files)
			},
			filters = {
				dotfiles = false, -- Set to true to hide dotfiles
				-- custom = { ".git", "node_modules", ".cache" }, -- Hide files and folders matching these patterns
			},
			git = {
				enable = true, -- Show git status icons
				ignore = false, -- Set to true to ignore git status for certain files
			},
			-- diagnostics = {
			-- 	enable = true, -- Enable LSP diagnostics in the tree
			-- 	icons = {
			-- 		hint = "",
			-- 		info = "",
			-- 		warning = "",
			-- 		error = "",
			-- 	},
			-- },
		})
	end,
}

return settings
