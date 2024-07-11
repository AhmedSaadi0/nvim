local map = vim.keymap.set

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "اعادة ترتيب الكود" })

map("n", "<leader>sf", function()
	vim.cmd("noautocmd w")
end, { desc = "حفظ بدون اعادة ترتيب" })

map("n", "<leader>ss", function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local word = vim.fn.expand("<cword>")
	local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

	if word:find("[a-z][A-Z]") then
		local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
	elseif word:find("_[a-z]") then
		local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
			return l:upper()
		end)
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
	else
		print("لم يتم العثور على نص مطابق")
	end
end, { desc = "تحويل الى snake_case" })

map("x", "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end, { desc = "استخراج الى دالة" })

map("x", "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end, { desc = "استخراج الدالة الى ملف" })

-- Extract function supports only visual mode
map("x", "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end, { desc = "استخراج المتغير" })

-- Extract variable supports only visual mode
map("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end, { desc = "جعل الدالة بسطر واحد" })

-- Inline func supports only normal
map({ "n", "x" }, "<leader>ri", function()
	require("refactoring").refactor("Inline Variable")
end, { desc = "جعل المتغير في سطر" })

-- Inline var supports both normal and visual mode
map("n", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end, { desc = "استخراج البلوك" })

map("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end, { desc = "استخراج البلوك الى ملف" })

-- Keymap for formatting
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
		timeout_ms = 10000,
	})
end, { desc = "Format file or range (in visual mode)" })
