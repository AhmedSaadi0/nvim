local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "دخول وضع الاوامر" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "اعادة ترتيب الكود" })

-- map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- map("n", "<leader>tt", function()
-- 	require("base46").toggle_transparency()
-- end, { desc = "Toggle transparency" })

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

-- Visual mappings
-- map("v", "<leader>re", function()
-- 	require("refactoring").refactor("Extract Function")
-- end, { desc = "إعادة بناء التعليمات البرمجية" })

-- map("v", "<leader>rv", function()
-- 	require("refactoring").refactor("Extract Variable")
-- end, { desc = "إعادة بناء التعليمات البرمجية" })

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
-- Extract block supports only normal mode
map("n", "<leader>+", function()
	vim.cmd(":vertical resize +5")
end, { desc = "تكبير العرض +5" })

map("n", "<leader>-", function()
	vim.cmd(":vertical resize -5")
end, { desc = "تصغير العرضض -5" })

map("n", "<c-a>", function()
	vim.cmd("normal! ggVG")
end, { desc = "تصغير العرضض -5" })

-- delete instead of cut
-- map("n", "x", '"_x')
-- map("n", "d", '"_d')
-- map("n", "D", '"_D')
-- map("v", "d", '"_d')
--
-- map("n", "c", '"_c')
-- map("n", "C", '"_C')
-- map("v", "c", '"_c')
--
-- map("n", "<leader>d", "d")
-- map("n", "<leader>D", "D")
-- map("v", "<leader>d", "d")
--
-- map("n", "<leader>c", "c")
-- map("n", "<leader>C", "C")
-- map("v", "<leader>c", "c")

map("n", "<leader>sv", "<C-w>v", { desc = "تقسيم النافذة عموديا" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "تقسيم النافذة افقيا" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "تقسيم النافذة بالتتساوي" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "اغلاق النافذة المحددة" }) -- close current split window

----------------------
-- buffers and tabs --
----------------------
map(
	"n",
	"<C-S-Left>",
	":BufferLineCyclePrev<CR>",
	{ noremap = true, silent = true, desc = "الانتقال الى الملف التالي" }
)
map(
	"n",
	"<C-S-Right>",
	":BufferLineCycleNext<CR>",
	{ noremap = true, silent = true, desc = "الانتقال الى الملف السابق" }
)
map(
	"n",
	"<S-h>",
	":BufferLineCyclePrev<CR>",
	{ noremap = true, silent = true, desc = "الانتقال الى الملف السابق" }
)
map(
	"n",
	"<S-l>",
	":BufferLineCycleNext<CR>",
	{ noremap = true, silent = true, desc = "الانتقال الى الملف التالي" }
)
-- map("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true, desc = "اغلاق الملف المفتوح" })

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
----------------------
-- ---------------- --
----------------------

-- Save file and quit
map("n", "<Leader>w", ":update<Return>", opts)
map("n", "<Leader>q", ":quit<Return>", opts)
map("n", "<Leader>Q", ":qa<Return>", opts)

-- Function to move the current line up
map("n", "<S-A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("v", "<S-A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Function to move the current line down
map("n", "<S-A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("v", "<S-A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Move cursor to the first character in the line
map("n", "<A-h>", "^", { noremap = true, silent = true })
map("v", "<A-h>", "^", { noremap = true, silent = true })

-- Move cursor to the last character in the line
map("n", "<A-l>", "g_", { noremap = true, silent = true })
map("v", "<A-l>", "g_", { noremap = true, silent = true })

-- Function to navigate between split screens
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- Enable Ctrl-Backspace to delete the whole word in insert mode
map("i", "<C-h>", "<C-w>", { noremap = true, silent = true })
