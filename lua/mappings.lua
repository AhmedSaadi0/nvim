require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "<leader>tt", function()
	require("base46").toggle_transparency()
end, { desc = "Toggle transperancy" })

map("n", "<leader>tt", function()
	require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

map("n", "<leader>sf", function()
	vim.cmd("noautocmd w")
end, { desc = "Save without formatting" })

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
		print("Not a snake_case or camelCase word")
	end
end, { desc = "Toggle snake_case camelCase" })

--[[
map("n", "<leader>bd", function()
  local current = vim.api.nvim_get_current_buf()
  vim.cmd("silent! bd " .. current)
  vim.cmd("redraw!")
end, { desc = "اغلاق الملف المفتوح" })
]]

map("n", "<leader>bo", function()
	vim.cmd("only")
end, { desc = "اغلاق اي بفر اخر" })

map("n", "<leader>ba", function()
	local buffers = vim.api.nvim_list_bufs()
	local toDelete = ""
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local current = vim.api.nvim_get_current_buf()
			local modified = vim.api.nvim_buf_get_option(buf, "modified")

			if buf ~= current and not modified then
				toDelete = toDelete .. " " .. buf
			end
		end
	end
	vim.cmd("silent! bd " .. toDelete)
	vim.cmd("redraw!")
end, { desc = "اغلاق كل الملفات المفتوحة الا المعدل عليها" })

map("n", "<leader>tn", function()
	vim.cmd("tabnew")
end, { desc = "فتح تاب جديد" })

map("n", "<leader>td", function()
	vim.cmd("tabclose")
end, { desc = "اغلاق التب المحدد" })

-- Visual mappings
-- map("v", "<leader>re", function()
-- 	require("refactoring").refactor("Extract Function")
-- end, { desc = "إعادة بناء التعليمات البرمجية" })
--
-- map("v", "<leader>rv", function()
-- 	require("refactoring").refactor("Extract Variable")
-- end, { desc = "إعادة بناء التعليمات البرمجية" })

vim.keymap.set("x", "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end, { desc = "استخراج الى دالة" })
vim.keymap.set("x", "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end, { desc = "استخراج الدالة الى ملف" })
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end, { desc = "استخراج المتغير" })
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end, { desc = "جعل الدالة بسطر واحد" })
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function()
	require("refactoring").refactor("Inline Variable")
end, { desc = "جعل المتغير في سطر" })
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end, { desc = "استخراج البلوك" })
vim.keymap.set("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end, { desc = "استخراج البلوك الى ملف" })
-- Extract block supports only normal mode
vim.keymap.set("n", "<leader><Right>", function()
  vim.cmd(":vertical resize +5")
end, { desc = "تكبير العرض +5" })

vim.keymap.set("n", "<leader><Left>", function()
  vim.cmd(":vertical resize -5")
end, { desc = "تصغير العرضض -5" })


