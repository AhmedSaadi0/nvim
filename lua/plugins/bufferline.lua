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

		_G.close_buffer = function()
			local current_buffer = vim.api.nvim_get_current_buf()
			local buffers = vim.api.nvim_list_bufs()
			local next_buffer = nil

			-- Find the next buffer that is not NvimTree and is listed
			for _, buf in ipairs(buffers) do
				if vim.bo[buf].filetype ~= "NvimTree" and vim.fn.buflisted(buf) == 1 and buf ~= current_buffer then
					next_buffer = buf
					break
				end
			end

			-- If we found a next buffer, switch to it
			if next_buffer then
				vim.api.nvim_set_current_buf(next_buffer)
			end

			-- Close the current buffer
			vim.cmd("bdelete " .. current_buffer)
		end

		-- Key mapping for closing the buffer
		vim.api.nvim_set_keymap(
			"n",
			"<leader>x",
			":lua close_buffer()<CR>",
			{ noremap = true, silent = true, desc = "اغلاق الملف المفتوح" }
		)
	end,
}
