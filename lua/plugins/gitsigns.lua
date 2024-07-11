return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "الانتقال إلى الجزء التالي" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "الانتقال إلى الجزء السابق" })

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "تثبيت الجزء" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "إعادة تعيين الجزء" })
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "تثبيت الجزء (اختيار)" })
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "إعادة تعيين الجزء (اختيار)" })
				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "تثبيت الملف الكامل" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "التراجع عن تثبيت الجزء" })
				map(
					"n",
					"<leader>hR",
					gitsigns.reset_buffer,
					{ desc = "إعادة تعيين الملف الكامل" }
				)
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "عرض معاينة الجزء" })
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "عرض اللوم الكامل للسطر" })
				map(
					"n",
					"<leader>tb",
					gitsigns.toggle_current_line_blame,
					{ desc = "تبديل عرض اللوم للسطر الحالي" }
				)
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "عرض الفرق لهذا الملف" })
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "عرض الفرق مع النسخة السابقة" })
				map(
					"n",
					"<leader>hh",
					gitsigns.toggle_deleted,
					{ desc = "تبديل عرض الأجزاء المحذوفة" }
				)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "اختيار الجزء" })
			end,
		})
	end,
}
