local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>+", function()
	vim.cmd(":vertical resize +5")
end, { desc = "تكبير العرض +5" })

map("n", "<leader>-", function()
	vim.cmd(":vertical resize -5")
end, { desc = "تصغير العرضض -5" })

map("n", "<c-a>", function()
	vim.cmd("normal! ggVG")
end, { desc = "Select All" })

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

-- Map Ctrl-E to move to the end of the line in insert mode
vim.api.nvim_set_keymap("i", "<C-Right>", "<C-o>$", { noremap = true, silent = true })
-- Map Ctrl-A to move to the start of the line in insert mode
vim.api.nvim_set_keymap("i", "<C-Left>", "<C-o>^", { noremap = true, silent = true })

-- Alt + H to move one character left in insert mode
vim.api.nvim_set_keymap("i", "<M-h>", "<Left>", { noremap = true, silent = true })

-- Alt + L to move one character right in insert mode
vim.api.nvim_set_keymap("i", "<M-l>", "<Right>", { noremap = true, silent = true })

-- Alt + J to move one line down in insert mode
vim.api.nvim_set_keymap("i", "<M-j>", "<Down>", { noremap = true, silent = true })

-- Alt + K to move one line up in insert mode
vim.api.nvim_set_keymap("i", "<M-k>", "<Up>", { noremap = true, silent = true })

-- Ctrl + H to move to the start of the line in insert mode
vim.api.nvim_set_keymap("i", "<C-h>", "<C-o>^", { noremap = true, silent = true })

-- Ctrl + L to move to the end of the line in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<C-o>$", { noremap = true, silent = true })

------------------
-- Close buffer --
------------------
_G.close_buffer = function()
	local current_buffer = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local next_buffer = nil

	-- Find the next buffer that is not NvimTree and is listed
	for _, buf in ipairs(buffers) do
		if vim.bo[buf].filetype ~= "NvimTree" and vim.fn.buflisted(buf) == 1 and buf ~= current_buffer then
			next_buffer = buf
			break
		end
	end

	-- If we found a next buffer, switch to it
	if next_buffer then
		vim.api.nvim_set_current_buf(next_buffer)
	end

	-- Close the current buffer
	vim.cmd("bdelete " .. current_buffer)
end

-- Function to toggle mouse
local function toggle_mouse()
	if vim.o.mouse == "" then
		vim.o.mouse = "a"
		print("Mouse enabled")
	else
		vim.o.mouse = ""
		print("Mouse disabled")
	end
end

-- Key mapping to toggle mouse
map("n", "<leader>tm", toggle_mouse, vim.tbl_extend("force", opts, { desc = "Toggle Mouse" }))

if not vim.g.neovide then
	map("n", "<leader>tt", function()
		require("base46").toggle_transparency()
	end, { desc = "Toggle transparency" })
else
	map("n", "<leader>tt", function()
		if vim.g.neovide_opacity == 1.0 then
			vim.g.neovide_opacity = 0.9
		else
			vim.g.neovide_opacity = 1.0
		end
	end, { noremap = true, silent = true, desc = "Toggle transparency" })
end

map(
	"n",
	"<leader>gh",
	"<cmd>Telescope git_bcommits<CR>",
	{ noremap = true, silent = true, desc = "تاريخ GIT للملف" }
)

vim.api.nvim_set_keymap("n", "<leader>aw", ":wa<CR>", { noremap = true, silent = true, desc = "حفظ الكل" })
-- vim.api.nvim_set_keymap("n", "<leader>o", ":Navbuddy<CR>", opts)

vim.keymap.set("n", "<leader>th", function()
	require("nvchad.themes").open()
end, { desc = "تغيير الثيم" })

vim.keymap.set("n", "<leader>nc", function()
	require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Clear Notifications" })

vim.keymap.set("n", "<leader>nv", function()
	require("noice").cmd("history")
end, { desc = "Show Notification History" })

vim.keymap.set("n", "<leader>m", function()
	require("menu").open("default")
end, { desc = "Open Main Menu" })

map("i", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- map("i", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

map("i", "<C-s>", vim.lsp.buf.signature_help, opts)
map("n", "<C-s>", vim.lsp.buf.signature_help, opts)
