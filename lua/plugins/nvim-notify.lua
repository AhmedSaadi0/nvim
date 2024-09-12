return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 5000,
		background_colour = "#000000",
		render = "wrapped-compact",
		stages = "fade_in_slide_out", -- Animation style
		max_width = 50,
		max_height = 20,
		fps = 30,
	},
	config = function()
		local notify = require("notify")
		-- Set notify as the default handler
		vim.notify = notify
		-- Configure notify to show in the bottom-right
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 5000,
			background_colour = "#000000",
			render = "wrapped-compact",
			max_width = 50,
			max_height = 20,
			fps = 30,
			-- Explicit position configuration
			top_down = false, -- This makes notifications appear from bottom to top
		})
	end,
}
