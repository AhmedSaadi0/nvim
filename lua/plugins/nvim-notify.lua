return {
	"rcarriga/nvim-notify",

	config = function()
		local notify = require("notify")
		-- Set notify as the default handler
		vim.notify = notify

		-- Configure notify to show in the bottom-right
		notify.setup({
			stages = "slide",
			fps = 120,
			timeout = 2000,
			max_width = 40,
			max_height = 20,
			-- minimum_width = 40,
			merge_duplicates = 1,
			-- background_colour = "#00000000",
			-- background_colour = vim.opt.background:get() == "dark" and "#00000055" or "#ffffff55",
			-- render = "wrapped-compact",
			-- Explicit position configuration
			-- top_down = false, -- This makes notifications appear from bottom to top
		})
	end,
}
