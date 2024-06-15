return {
	"doki-theme/doki-theme-vim",
	priority = 1000,
	config = function()
		-- Apply the specific theme you want to use
		-- vim.cmd("colorscheme doki") -- Change to your desired theme, e.g., doki-theme-<variant>
		-- require("doki").setup({
		-- 	transparent = false,
		-- })
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
	end,
}
