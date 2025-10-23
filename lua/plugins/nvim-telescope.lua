return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-live-grep-args.nvim",
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		--- تحسين مقترح: تم تفعيل هذه الإضافة لتوحيد واجهة المستخدم (مثل Code Actions)
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		-- Key mappings (اختصارات لوحة المفاتيح)
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end, { desc = "[F]ind by [G]rep (Live)" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.live_grep({ glob_pattern = "!{spec,test}" })
		end, { desc = "[F]ind in [C]ode (Live Grep)" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Tags" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[F]ind [S]ymbols" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld Files" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord under Cursor" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				winblend = 10,
				previewer = false,
				layout_config = { width = 0.7 },
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odos" })

		--- تحسين مقترح: إضافة اختصارات جديدة مفيدة
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume Last Search" })
		vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "[F]ind [G]it [S]tatus" })

		-- Telescope setup (إعدادات Telescope الرئيسية)
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
					"50",
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
				--- تحسين مقترح: استخدام "fd" للبحث الأسرع عن الملفات
				-- تأكد من تثبيت "fd" على نظامك: https://github.com/sharkdp/fd
				find_files = {
					find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
				},
			},
			--- تحسين مقترح: تفعيل إعدادات الإضافات هنا
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({
						-- يمكنك تخصيص المظهر هنا إذا أردت
					}),
				},
			},
		})

		-- Load extensions lazily (تحميل الإضافات بشكل كسول لتحسين سرعة بدء التشغيل)
		vim.defer_fn(function()
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select") -- تأكد من تحميل الإضافة هنا
		end, 100)
	end,
}
