local settings = {
	"kyazdani42/nvim-tree.lua",
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			view = {
				width = 50, -- Set your desired default width here
				relativenumber = true,
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
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		vim.api.nvim_create_augroup("NvimTreeMappings", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = "NvimTreeMappings",
			pattern = "NvimTree",
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"<C-h>",
					"<cmd>NvimTreeCollapse<CR>",
					{ noremap = true, silent = true, desc = "Collapse file explorer" }
				)
			end,
		})
	end,
}

return settings
