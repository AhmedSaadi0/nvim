return {
	enabled = true,
	notify = true, -- إظهار إشعار عند فتح ملف كبير
	size = 1.5 * 1024 * 1024, -- الحد: 1.5 ميجابايت (يمكن تعديله)
	line_length = 1000, -- متوسط طول السطر (مفيد للملفات minified)
	-- دالة التهيئة التي تُنفّذ عند اكتشاف ملف كبير
	setup = function(ctx)
		-- ctx = { buf = رقم_البافر، ft = نوع_الملف }

		-- تعطيل matchparen إذا كان موجودًا
		if vim.fn.exists(":NoMatchParen") ~= 0 then
			vim.cmd([[NoMatchParen]])
		end

		-- تعطيل ميزات قد تُبطئ الأداء
		Snacks.util.wo(0, {
			foldmethod = "manual",
			statuscolumn = "",
			conceallevel = 0,
		})

		-- تعطيل الإكمال التلقائي لهذا البافر
		vim.b.completion = false

		-- تعطيل إضافات mini.nvim إذا كانت مستخدمة
		vim.b.minianimate_disable = true
		vim.b.minihipatterns_disable = true

		-- تفعيل syntax highlighting بشكل آمن بعد تحميل الملف
		vim.schedule(function()
			if vim.api.nvim_buf_is_valid(ctx.buf) then
				vim.bo[ctx.buf].syntax = ctx.ft
			end
		end)
	end,
}
