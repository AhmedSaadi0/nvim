return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	event = "BufRead",
	config = function()
		require("ibl").setup({
			indent = {
				-- بدلاً من تعريف ألواننا الخاصة، نستخدم أسماء مجموعات الهايلايت
				-- الموجودة في الثيم. ستقوم الإضافة بتدوير هذه الألوان.
				highlight = {
					"Comment",
					-- "String",
					-- "Number",
					-- "Function",
					-- "Type",
					-- "Constant",
				},
				-- نستخدم خطًا رفيعًا لمظهر أنظف
				char = "▏",
			},

			-- scope = {
			-- 	enabled = true,
			-- 	-- نجعل هايلايت النطاق يستخدم لون البحث في الثيم، لأنه يكون دائمًا مميزًا
			-- 	highlight = { "Search" },
			-- },
			-- لم نعد بحاجة لقسم whitespace بنفس الطريقة
			-- لأننا لا نحدد ألوانًا مخصصة للمسافات
			whitespace = {
				remove_blankline_trail = true,
			},
		})
		-- require("configs.ibl")
		vim.opt.list = true
		-- vim.opt.listchars:append("space:⋅")
		-- vim.opt.listchars:append("eol:↴")
	end,
}
