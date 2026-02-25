return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")
		vim.notify = notify

		notify.setup({

			stages = "slide", -- "fade" أو "static" للتجربة
			fps = 240,
			timeout = 2000,
			max_width = 50,
			max_height = 20,
			merge_duplicates = 1,
			top_down = false,

			on_open = function(win)
				local config = vim.api.nvim_win_get_config(win)

				local bottom_margin = 2 -- عدد الأسطر من الأسفل
				local right_margin = 2 -- عدد الأعمدة من اليمين

				config.row = config.row - bottom_margin
				config.col = config.col - right_margin

				vim.api.nvim_win_set_config(win, config)
			end,
		})
	end,
}
