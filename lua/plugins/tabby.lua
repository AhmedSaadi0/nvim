return {
	"nanozuki/tabby.nvim",
	config = function()
		local tabby = require("tabby")
		tabby.setup({
			tabline = {
				-- Configure tabline to show buffers per tab
				layout = "active_wins_at_tail",
				show_tabs_only = true,
			},
		})
	end,
}
