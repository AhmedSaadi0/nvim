return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	event = "BufRead",
	config = function()
		require("configs.ibl")
		vim.opt.list = true
		-- vim.opt.listchars:append("space:⋅")
		-- vim.opt.listchars:append("eol:↴")
	end,
}
