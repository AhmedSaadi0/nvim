local M = {}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "دخول وضع الاوامر" })

-- Formatting
map({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
		timeout_ms = 10000,
	})
end, { desc = "Format file or range (in visual mode)" })

map("n", "<leader>sf", function()
	vim.cmd("noautocmd w")
end, { desc = "حفظ بدون اعادة ترتيب" })

-- Convert between snake_case and camelCase
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

-- Refactoring
map("x", "<leader>re", ":Refactor extract ", { noremap = true })
map("x", "<leader>rf", ":Refactor extract_to_file ", { noremap = true })
map("x", "<leader>rv", ":Refactor extract_var ", { noremap = true })
map({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { noremap = true })
map("n", "<leader>rI", ":Refactor inline_func", { noremap = true })
map("n", "<leader>rb", ":Refactor extract_block", { noremap = true })
map("n", "<leader>rbf", ":Refactor extract_block_to_file", { noremap = true })

-- Pylsp linting control
local function update_pylsp_settings(enable_linting)
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	for _, client in ipairs(clients) do
		if client.name == "pylsp" then
			client.config.settings.pylsp.plugins.pylint.enabled = enable_linting
			client.config.settings.pylsp.plugins.pycodestyle.enabled = enable_linting
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
	end
end

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function() end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function() end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function() end,
})

map("n", "<leader>le", function()
	update_pylsp_settings(true)
end, { desc = "تشغيل pylsp linting" })

map("n", "<leader>ld", function()
	update_pylsp_settings(false)
end, { desc = "ايقاف pylsp linting" })

-- Show definition path
local function show_path()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
		if result == nil or vim.tbl_isempty(result) then
			print("No definition found")
			return
		end

		local definition = result[1]
		local uri = definition.uri or definition.targetUri
		local path = vim.uri_to_fname(uri)

		local project_root = vim.fn.getcwd()
		if vim.startswith(path, project_root) then
			path = vim.fn.fnamemodify(path, ":~:.")
		end

		local width = math.min(80, #path + 2)
		local height = 1
		local row = 1
		local col = 1

		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { path })

		local win = vim.api.nvim_open_win(buf, false, {
			style = "minimal",
			relative = "cursor",
			width = width,
			height = height,
			row = row,
			col = col,
			border = "rounded",
		})

		vim.cmd(
			string.format(
				"autocmd CursorMoved,CursorMovedI,InsertCharPre <buffer> ++once lua pcall(vim.api.nvim_win_close, %d, true)",
				win
			)
		)
	end)
end

map("n", "<leader>k", show_path, { desc = "عرض مسار المتغير" })

-- Django html formatter
local function run_djhtml()
	local filename = vim.fn.expand("%:p")
	vim.cmd("!djhtml " .. filename)
end

map("n", "<leader>fd", run_djhtml, { noremap = true, silent = true })

-- Buffer and tab actions (Snacks + built-ins)
map("n", "<leader>bo", function()
	require("snacks").bufdelete.all()
end, { noremap = true, silent = true, desc = "اغلاق كل البفرز" })

map("n", "<leader>ba", function()
	local current = vim.api.nvim_get_current_buf()
	require("snacks").bufdelete.delete({
		filter = function(buf)
			if not vim.api.nvim_buf_is_loaded(buf) then
				return false
			end
			if buf == current then
				return false
			end
			if vim.bo[buf].modified then
				return false
			end
			return true
		end,
	})
end, { noremap = true, silent = true, desc = "اغلاق اي بفر اخر لم يتم تعديلة" })

map("n", "<C-S-h>", ":tabnext<CR>", opts)
map("n", "<C-S-l>", ":tabprevious<CR>", opts)
map("n", "<A-S-h>", ":tabnext<CR>", opts)
map("n", "<A-S-l>", ":tabprevious<CR>", opts)

map("n", "<C-S-Left>", ":bnext<CR>", opts)
map("n", "<C-S-Right>", ":bprevious<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)

map("n", "<leader>x", function()
	require("snacks").bufdelete()
end, opts)

map("n", "<leader>tn", function()
	vim.cmd("tabnew")
end, { desc = "فتح تاب جديد" })

map("n", "<leader>td", function()
	vim.cmd("tabclose")
end, { desc = "اغلاق التب المحدد" })

-- Window and editor actions
map("n", "<leader>+", function()
	vim.cmd(":vertical resize +5")
end, { desc = "تكبير العرض +5" })

map("n", "<leader>-", function()
	vim.cmd(":vertical resize -5")
end, { desc = "تصغير العرضض -5" })

map("n", "<c-a>", function()
	vim.cmd("normal! ggVG")
end, { desc = "Select All" })

map("n", "<leader>sv", "<C-w>v", { desc = "تقسيم النافذة عموديا" })
map("n", "<leader>sh", "<C-w>s", { desc = "تقسيم النافذة افقيا" })
map("n", "<leader>se", "<C-w>=", { desc = "تقسيم النافذة بالتتساوي" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "اغلاق النافذة المحددة" })

map("n", "<Leader>w", ":update<Return>", opts)
map("n", "<Leader>q", ":quit<Return>", opts)
map("n", "<Leader>Q", ":qa<Return>", opts)

map("n", "<S-A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("v", "<S-A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("n", "<S-A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
map("v", "<S-A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

map("n", "<A-h>", "^", { noremap = true, silent = true })
map("v", "<A-h>", "^", { noremap = true, silent = true })
map("n", "<A-l>", "g_", { noremap = true, silent = true })
map("v", "<A-l>", "g_", { noremap = true, silent = true })

map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

map("i", "<C-h>", "<C-w>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Right>", "<C-o>$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Left>", "<C-o>^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-l>", "<Right>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<C-o>^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<C-o>$", { noremap = true, silent = true })

-- Close current buffer without breaking layout (legacy helper)
_G.close_buffer = function()
	local current_buffer = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local next_buffer = nil

	for _, buf in ipairs(buffers) do
		if vim.bo[buf].filetype ~= "NvimTree" and vim.fn.buflisted(buf) == 1 and buf ~= current_buffer then
			next_buffer = buf
			break
		end
	end

	if next_buffer then
		vim.api.nvim_set_current_buf(next_buffer)
	end

	vim.cmd("bdelete " .. current_buffer)
end

local function toggle_mouse()
	if vim.o.mouse == "" then
		vim.o.mouse = "a"
		print("Mouse enabled")
	else
		vim.o.mouse = ""
		print("Mouse disabled")
	end
end

map("n", "<leader>tm", toggle_mouse, vim.tbl_extend("force", opts, { desc = "Toggle Mouse" }))

local transparency = { enabled = false, saved = {} }
local function toggle_transparency()
	local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer", "FloatBorder" }
	transparency.enabled = not transparency.enabled

	if transparency.enabled then
		for _, group in ipairs(groups) do
			if not transparency.saved[group] then
				transparency.saved[group] = vim.api.nvim_get_hl(0, { name = group, link = false })
			end
			vim.api.nvim_set_hl(0, group, { bg = "NONE" })
		end
	else
		for _, group in ipairs(groups) do
			local hl = transparency.saved[group]
			if hl then
				vim.api.nvim_set_hl(0, group, hl)
			else
				vim.api.nvim_set_hl(0, group, {})
			end
		end
	end
end

if not vim.g.neovide then
	map("n", "<leader>tt", toggle_transparency, { desc = "Toggle transparency" })
else
	map("n", "<leader>tt", function()
		if vim.g.neovide_opacity == 1.0 then
			vim.g.neovide_opacity = 0.9
		else
			vim.g.neovide_opacity = 1.0
		end
	end, { noremap = true, silent = true, desc = "Toggle transparency" })
end

map("n", "<leader>gh", function()
	local snacks = require("snacks")
	if snacks.picker.git_log_file then
		snacks.picker.git_log_file()
	else
		snacks.picker.git_log({ current_file = true })
	end
end, { noremap = true, silent = true, desc = "تاريخ GIT للملف" })

vim.api.nvim_set_keymap("n", "<leader>aw", ":wa<CR>", { noremap = true, silent = true, desc = "حفظ الكل" })

map("n", "<leader>th", function()
	require("snacks").picker.colorschemes()
end, { desc = "تغيير الثيم" })

map("n", "<leader>m", function()
	require("menu").open("default")
end, { desc = "Open Main Menu" })

map("i", "<C-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("i", "<C-s>", vim.lsp.buf.signature_help, opts)
map("n", "<C-s>", vim.lsp.buf.signature_help, opts)

map("n", "<leader>rl", "<cmd>set rl!<CR>", { desc = "Toggle Right-to-Left (RTL) mode" })

-- Snacks picker mappings (replacing Telescope)
map("n", "<leader>ff", function()
	require("snacks").picker.files()
end, { desc = "[F]ind [F]iles" })

map("n", "<leader>fg", function()
	require("snacks").picker.grep()
end, { desc = "[F]ind by [G]rep (Live)" })

map("n", "<leader>fc", function()
	require("snacks").picker.grep({ glob = "!{spec,test}" })
end, { desc = "[F]ind in [C]ode (Live Grep)" })

map("n", "<leader>fb", function()
	require("snacks").picker.buffers()
end, { desc = "[F]ind [B]uffers" })

map("n", "<leader>fh", function()
	require("snacks").picker.help()
end, { desc = "[F]ind [H]elp Tags" })

map("n", "<leader>fs", function()
	require("snacks").picker.lsp_symbols()
end, { desc = "[F]ind [S]ymbols" })

map("n", "<leader>fo", function()
	require("snacks").picker.recent()
end, { desc = "[F]ind [O]ld Files" })

map("n", "<leader>fw", function()
	require("snacks").picker.grep_word()
end, { desc = "[F]ind [W]ord under Cursor" })

map("n", "<leader>fk", function()
	require("snacks").picker.keymaps()
end, { desc = "[F]ind [K]eymaps" })

map("n", "<leader>/", function()
	require("snacks").picker.lines()
end, { desc = "[/] Fuzzily search in current buffer" })

map("n", "<leader>ft", function()
	local ok, snacks = pcall(require, "snacks")
	if ok and snacks.picker.todo_comments then
		snacks.picker.todo_comments()
	else
		vim.cmd("TodoQuickFix")
	end
end, { desc = "[F]ind [T]odos" })

map("n", "<leader>fr", function()
	require("snacks").picker.resume()
end, { desc = "[F]ind [R]esume Last Search" })

map("n", "<leader>fD", function()
	require("snacks").picker.diagnostics()
end, { desc = "[F]ind [D]iagnostics" })

map("n", "<leader>fgs", function()
	require("snacks").picker.git_status()
end, { desc = "[F]ind [G]it [S]tatus" })

map("n", "<leader>gl", function()
	require("snacks").lazygit.open()
end, { desc = "Open Lazygit" })

M.lsp_attach = function(ev)
	local lsp_opts = { buffer = ev.buf, silent = true }

	lsp_opts.desc = "عرض المراجع باستخدام Snacks"
	map("n", "gr", function()
		require("snacks").picker.lsp_references()
	end, lsp_opts)

	lsp_opts.desc = "الانتقال إلى التصريح"
	map("n", "gD", vim.lsp.buf.declaration, lsp_opts)

	lsp_opts.desc = "عرض التعريفات باستخدام Snacks"
	map("n", "gd", function()
		require("snacks").picker.lsp_definitions()
	end, lsp_opts)

	lsp_opts.desc = "عرض التطبيقات باستخدام Snacks"
	map("n", "gi", function()
		require("snacks").picker.lsp_implementations()
	end, lsp_opts)

	lsp_opts.desc = "عرض تعريفات النوع باستخدام Snacks"
	map("n", "gt", function()
		require("snacks").picker.lsp_type_definitions()
	end, lsp_opts)

	lsp_opts.desc = "عرض الإجراءات المتاحة"
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, lsp_opts)

	lsp_opts.desc = "إعادة تسمية ذكية"
	map("n", "<leader>rn", vim.lsp.buf.rename, lsp_opts)

	lsp_opts.desc = "عرض تشخيصات الملف باستخدام Snacks"
	map("n", "<leader>D", function()
		require("snacks").picker.diagnostics_buffer()
	end, lsp_opts)

	lsp_opts.desc = "عرض تشخيصات السطر"
	map("n", "<leader>d", vim.diagnostic.open_float, lsp_opts)

	lsp_opts.desc = "الانتقال إلى التشخيص السابق"
	map("n", "[d", vim.diagnostic.goto_prev, lsp_opts)

	lsp_opts.desc = "الانتقال إلى التشخيص التالي"
	map("n", "]d", vim.diagnostic.goto_next, lsp_opts)

	lsp_opts.desc = "عرض التوثيق لما هو تحت المؤشر"
	map("n", "K", vim.lsp.buf.hover, lsp_opts)

	lsp_opts.desc = "إعادة تشغيل LSP"
	map("n", "<leader>rs", ":LspRestart<CR>", lsp_opts)

	lsp_opts.desc = "اصلاح الاستيراد لبيثون"
	map("n", "<leader>ii", function()
		if vim.bo.filetype == "python" then
			vim.cmd(
				"!autoflake --in-place --remove-all-unused-imports "
					.. vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
			)
			vim.cmd("!isort " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
			vim.cmd("edit!")
		end
	end, lsp_opts)
end

return M
