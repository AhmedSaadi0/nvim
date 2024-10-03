return {
	"yorik1984/newpaper.nvim",
	priority = 1000,
	config = function()
		require("newpaper").setup({
			style = "dark",
		})
	end,
}
