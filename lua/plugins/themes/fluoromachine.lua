return {
	"maxmx03/fluoromachine.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local fm = require("fluoromachine")

		fm.setup({
			glow = true,
			theme = "fluoromachine",
			-- theme = "retrowave",
			transparent = true,
		})

		vim.cmd.colorscheme("fluoromachine")
	end,
}
