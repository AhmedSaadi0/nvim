return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()

		-- Set up autocommand to attach Colorizer to each buffer
		vim.api.nvim_create_autocmd("BufReadPost", {
			callback = function()
				require("colorizer").attach_to_buffer(0)
			end,
		})
	end,
}
