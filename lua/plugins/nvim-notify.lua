return {
	"rcarriga/nvim-notify",

	config = function()
		local notify = require("notify")
		-- Set notify as the default handler
		vim.notify = notify
		-- Configure notify to show in the bottom-right
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 5000,
			-- background_colour = "#00000000",
			-- background_colour = vim.opt.background:get() == "dark" and "#00000055" or "#ffffff55",
			-- render = "wrapped-compact",
			max_width = 30,
			max_height = 20,
			fps = 120,
			-- Explicit position configuration
			top_down = false, -- This makes notifications appear from bottom to top
		})
	end,
}
