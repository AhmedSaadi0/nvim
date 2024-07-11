return {
	"akinsho/bufferline.nvim",
	-- tag = "v2.*",
	-- tag = "v1.*",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				separator_style = "slope",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
			},
		})
	end,
}
