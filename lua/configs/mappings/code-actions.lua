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

local timer = nil -- Global timer variable

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

-- Function to handle enabling linting with a delay
local function schedule_enable_linting()
	if timer then
		timer:stop()
		timer:close()
	end
	timer = vim.loop.new_timer()
	timer:start(30000, 0, function()
		vim.schedule(function()
			update_pylsp_settings(true)
		end)
	end)
end

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if timer then
			timer:stop()
			timer:close()
			timer = nil
		end
		update_pylsp_settings(false)
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		-- schedule_enable_linting()
		-- update_pylsp_settings(true)
	end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function()
		update_pylsp_settings(false)
	end,
})

map("n", "<leader>le", function()
	update_pylsp_settings(true)
end, { desc = "تشغيل pylsp linting" })

map("n", "<leader>ld", function()
	update_pylsp_settings(false)
end, { desc = "ايقاف pylsp linting" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>k",
	":lua ShowPath()<CR>",
	{ noremap = true, silent = true, desc = "عرض مسار المتغير" }
)

function ShowPath()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
		if result == nil or vim.tbl_isempty(result) then
			print("No definition found")
			return
		end

		local definition = result[1]
		local uri = definition.uri or definition.targetUri
		local path = vim.uri_to_fname(uri)

		-- Get the project root (assuming LSP has set the project root correctly)
		local project_root = vim.fn.getcwd()

		-- If the path is within the project, show a relative path, otherwise show full path
		if vim.startswith(path, project_root) then
			path = vim.fn.fnamemodify(path, ":~:.") -- Display as relative to the current directory
		end

		-- Define the window size and position
		local width = math.min(80, #path + 2)
		local height = 1
		local row = 1
		local col = 1

		-- Create a new buffer
		local buf = vim.api.nvim_create_buf(false, true)

		-- Set buffer content to the file path
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { path })

		-- Create a floating window
		local opts = {
			style = "minimal",
			relative = "cursor",
			width = width,
			height = height,
			row = row,
			col = col,
			border = "rounded",
		}
		local win = vim.api.nvim_open_win(buf, false, opts)

		-- Auto-close window on cursor move or keypress
		vim.cmd(
			string.format(
				"autocmd CursorMoved,CursorMovedI,InsertCharPre <buffer> ++once lua pcall(vim.api.nvim_win_close, %d, true)",
				win
			)
		)
	end)
end

vim.api.nvim_set_keymap("n", "<leader>fd", ":lua run_djhtml()<CR>", { noremap = true, silent = true })
function run_djhtml()
	local filename = vim.fn.expand("%:p")
	vim.cmd("!djhtml " .. filename)
end
