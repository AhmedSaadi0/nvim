return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	event = "BufRead",
	config = function()
		vim.opt.list = true
		-- vim.opt.listchars:append("space:⋅")
		-- vim.opt.listchars:append("eol:↴")
	end,
}
