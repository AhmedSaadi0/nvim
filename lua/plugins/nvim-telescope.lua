return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		-- "nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		-- Key mappings
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.live_grep({ glob_pattern = "!{spec,test}" })
		end, { desc = "Live Grep Code" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
		-- vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Search Git Commits" })
		-- vim.keymap.set("n", "<leader>fgb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				winblend = 10,
				previewer = false,
				layout_config = { width = 0.7 },
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		-- Telescope setup
		telescope.setup({
			defaults = {
				initial_mode = "insert",
				file_sorter = require("telescope.sorters").get_fzf_sorter,
				generic_sorter = require("telescope.sorters").get_fzf_sorter,
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.4,
					},
					vertical = {
						mirror = true,
					},
					width = 0.9,
					height = 0.9,
					-- preview_cutoff = 120,
				},
				vimgrep_arguments = {
					"rg",
					"-L",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--max-depth",
					"5", -- Reduce search depth
					-- "--color=never",
				},
				path_display = { "truncate" },
				mappings = {
					n = {
						["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					i = {
						["<C-j>"] = actions.cycle_history_next,
						["<C-k>"] = actions.cycle_history_prev,
						["<CR>"] = function(prompt_bufnr)
							local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
							local multi = picker:get_multi_selection()
							if not vim.tbl_isempty(multi) then
								actions.close(prompt_bufnr)
								for _, j in pairs(multi) do
									if j.path ~= nil then
										vim.cmd(string.format("%s %s", "edit", j.path))
									end
								end
							else
								actions.select_default(prompt_bufnr)
							end
						end,
						["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-S-d>"] = actions.delete_buffer,
						["<C-s>"] = actions.cycle_previewers_next,
						["<C-a>"] = actions.cycle_previewers_prev,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		-- Load extensions lazily
		vim.defer_fn(function()
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("live_grep_args")
			-- Load more extensions here as needed
		end, 100)
	end,
}
