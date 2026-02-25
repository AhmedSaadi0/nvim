local map = vim.keymap.set

local opt = {
	noremap = true,
	silent = true,
}

map("n", "<leader>bo", function()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			pcall(vim.api.nvim_buf_delete, buf, { force = false })
		end
	end
end, {
	noremap = true,
	silent = true,
	desc = "اغلاق كل البفرز",
})

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

map("n", "<C-S-h>", ":tabnext<CR>", opt)
map("n", "<C-S-l>", ":tabprevious<CR>", opt)

map("n", "<A-S-h>", ":tabnext<CR>", opt)
map("n", "<A-S-l>", ":tabprevious<CR>", opt)

-- Navigate buffers
map("n", "<C-S-Left>", function()
	vim.cmd("bnext")
end, opt)
map("n", "<C-S-Right>", function()
	vim.cmd("bprevious")
end, opt)

map("n", "<S-h>", function()
	vim.cmd("bprevious")
end, opt)
map("n", "<S-l>", function()
	vim.cmd("bnext")
end, opt)

map("n", "<leader>x", function()
	vim.api.nvim_buf_delete(0, { force = false })
end, opt)

map("n", "<leader>tn", function()
	vim.cmd("tabnew")
end, { desc = "فتح تاب جديد" })

map("n", "<leader>td", function()
	vim.cmd("tabclose")
end, { desc = "اغلاق التب المحدد" })
