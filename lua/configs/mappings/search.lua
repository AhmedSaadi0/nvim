local map = vim.keymap.set

-- دالة مساعدة آمنة: تستدعي Snacks فقط عند الضغط على الاختصار
local function picker(source, opts)
	return function()
		require("snacks").picker[source](opts)
	end
end

map("n", "<leader>ff", picker("files"), { desc = "[F]ind [F]iles" }) -- تم تغييرها من find_files
map("n", "<leader>fg", picker("grep"), { desc = "[F]ind by [G]rep (Live)" }) -- تم تغييرها من live_grep

map("n", "<leader>fc", picker("grep", { glob = { "!{spec,test}" } }), { desc = "[F]ind in [C]ode (Live Grep)" })

map("n", "<leader>fb", picker("buffers"), { desc = "[F]ind [B]uffers" })
map("n", "<leader>fh", picker("help"), { desc = "[F]ind [H]elp Tags" })
map("n", "<leader>fs", picker("lsp_symbols"), { desc = "[F]ind [S]ymbols" })
map("n", "<leader>fo", picker("recent"), { desc = "[F]ind [O]ld Files" })
map("n", "<leader>fw", picker("grep_word"), { desc = "[F]ind [W]ord under Cursor" })
map("n", "<leader>fk", picker("keymaps"), { desc = "[F]ind [K]eymaps" })

-- استخدام دالة picker للخطوط أيضاً لتوحيد الكود
map("n", "<leader>/", picker("lines"), { desc = "[/] Search current buffer" })

-- بديل TodoTelescope (يعمل بشكل مدمج مع إضافة todo-comments)
map("n", "<leader>ft", picker("todo_comments"), { desc = "[F]ind [T]odos" })

map("n", "<leader>fr", picker("resume"), { desc = "[F]ind [R]esume Last Search" })
map("n", "<leader>fD", picker("diagnostics"), { desc = "[F]ind [D]iagnostics" })
map("n", "<leader>fgs", picker("git_status"), { desc = "[F]ind [G]it [S]tatus" })
