local map = vim.keymap.set

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
