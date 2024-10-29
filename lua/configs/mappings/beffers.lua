local map = vim.keymap.set

local opt = {
	noremap = true,
	silent = true,
}

map("n", "<leader>bo", function()
	require("nvchad.tabufline").closeAllBufs()
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

-- Navigate buffers
map("n", "<C-S-Left>", function()
	require("nvchad.tabufline").next()
end, opt)
map("n", "<C-S-Right>", function()
	require("nvchad.tabufline").prev()
end, opt)

map("n", "<S-h>", function()
	require("nvchad.tabufline").prev()
end, opt)
map("n", "<S-l>", function()
	require("nvchad.tabufline").next()
end, opt)

map("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, opt)

map("n", "<leader>tn", function()
	vim.cmd("tabnew")
end, { desc = "فتح تاب جديد" })

map("n", "<leader>td", function()
	vim.cmd("tabclose")
end, { desc = "اغلاق التب المحدد" })
