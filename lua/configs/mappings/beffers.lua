local map = vim.keymap.set

local opt = {
	noremap = true,
	silent = true,
}

map("n", "<C-S-Left>", ":BufferNext<CR>", opt)
map("n", "<C-S-Right>", ":BufferPrevious<CR>", opt)
map("n", "<S-h>", ":BufferPrevious<CR>", opt)
map("n", "<S-l>", ":BufferNext<CR>", opt)

map("n", "<leader>x", ":BufferClose<CR>", opt)

map("n", "<leader>bo", function()
	vim.cmd("only")
end, { noremap = true, silent = true, desc = "اغلاق اي بفر اخر" })

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
end, { noremap = true, silent = true, desc = "اغلاق اي بفر اخر لم يتم تعديلة" })

map("n", "<leader>bi", ":BufferPin<CR>", opt)
map("n", "<leader>bp", ":BufferPick<CR>", opt)
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opt)
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opt)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opt)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opt)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opt)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opt)

map("n", "<leader>tn", function()
	vim.cmd("tabnew")
end, { desc = "فتح تاب جديد" })

map("n", "<leader>td", function()
	vim.cmd("tabclose")
end, { desc = "اغلاق التب المحدد" })
