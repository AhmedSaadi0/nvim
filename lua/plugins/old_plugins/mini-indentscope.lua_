return {
	"echasnovski/mini.nvim",
	version = "*", -- أو يمكنك تثبيت إصدار معين
	config = function()
		require("mini.ai").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup({
			-- symbol = "▏", -- رمز الخط
			-- options = { try_as_border = true },
		})

		-- require('mini.statusline').setup({
		--   use_icons = vim.fn.has('nvim-0.9.0') ~= 0, -- استخدم الأيقونات إذا كانت متاحة
		-- })

		-- require("mini.files").setup()
	end,
}
