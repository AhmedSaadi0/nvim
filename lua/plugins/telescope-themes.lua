return {
	"andrew-george/telescope-themes",
	config = function()
		require("telescope").load_extension("themes")
		vim.keymap.set("n", "<leader>th", "<CMD>Telescope themes<CR>", { desc = "تغيير الثيم" })
	end,
}
