return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		anti_conceal = {
			-- Keep 1 line above/below the cursor unrendered to ease editing.
			above = 1,
			below = 1,
		},
		code = {
			-- Make code blocks stand out more without being too heavy.
			border = "thin",
			left_pad = 1,
			right_pad = 1,
			language_pad = 1,
		},
		heading = {
			enabled = true,
			render_modes = false,
			setext = true,
			atx = true,
			sign = false,
			icons = function()
				return ""
			end,
			position = "inline",
			signs = {},
			width = "block",
			left_margin = 0,
			left_pad = 0,
			right_pad = 0,
			min_width = 0,
			border = false,
			border_virtual = false,
			border_prefix = false,
			backgrounds = { "Normal" },
			foregrounds = { "Normal" },
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)

		local group = vim.api.nvim_create_augroup("RenderMarkdownKeymaps", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = "markdown",
			callback = function(event)
				local map = vim.keymap.set

				map("n", "<leader>rmt", "<cmd>RenderMarkdown buf_toggle<CR>", {
					buffer = event.buf,
					silent = true,
					desc = "تبديل رندر المارداون (الملف الحالي)",
				})
				map("n", "<leader>rmT", "<cmd>RenderMarkdown toggle<CR>", {
					buffer = event.buf,
					silent = true,
					desc = "تبديل رندر المارداون (عام)",
				})
				map("n", "<leader>rmp", "<cmd>RenderMarkdown preview<CR>", {
					buffer = event.buf,
					silent = true,
					desc = "معاينة رندر المارداون",
				})
				map("n", "<leader>rme", "<cmd>RenderMarkdown expand<CR>", {
					buffer = event.buf,
					silent = true,
					desc = "توسيع إخفاء المؤشر",
				})
				map("n", "<leader>rmc", "<cmd>RenderMarkdown contract<CR>", {
					buffer = event.buf,
					silent = true,
					desc = "تقليص إخفاء المؤشر",
				})
			end,
		})
	end,
}
