return {
	"doki-theme/doki-theme-vim",
	priority = 1000,
	config = function()
		-- vim.o.background = "dark"
		-- vim.cmd("colorscheme doki")
		-- vim.g.neovide_transparency = 1.0
		vim.cmd([[
			highlight Normal guibg=#1d1f21
			highlight NonText guibg=#1d1f21
		  ]])
	end,
}
