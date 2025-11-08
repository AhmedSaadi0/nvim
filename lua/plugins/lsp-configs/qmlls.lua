-- lua/plugins/lsp-configs/qmlls.lua

local util = require("lspconfig.util")

-- 🔧 تحديد مسارات استيراد Qt6
local qt_import_path = "/usr/lib64/qt6/qml"

local function find_root(fname)
	-- إذا وُجد shell.qml في أي مجلد أعلى من الملف الحالي => مشروع Quickshell
	local quickshell_root = util.root_pattern("shell.qml")(fname)
	if quickshell_root then
		return quickshell_root
	end

	-- إذا وُجد CMakeLists.txt أو .git => مشروع Qt/QML
	local qt_root = util.root_pattern("CMakeLists.txt", ".git")(fname)
	if qt_root then
		return qt_root
	end

	-- fallback: إذا الملف qml في مجلد مشروع يحتوي qmlimports/ أو ملفات QML أخرى
	local dir = util.path.dirname(fname)
	local function contains_qml_files(path)
		local handle = vim.loop.fs_scandir(path)
		if not handle then
			return false
		end
		while true do
			local name, type = vim.loop.fs_scandir_next(handle)
			if not name then
				break
			end
			if name:match("%.qml$") then
				return true
			end
		end
		return false
	end
	while dir and dir ~= "/" do
		if contains_qml_files(dir) then
			return dir
		end
		dir = util.path.dirname(dir)
	end

	-- fallback نهائي
	return vim.loop.cwd()
end

return {
	cmd = { "qmlls" },
	cmd_env = {
		QML2_IMPORT_PATH = qt_import_path,
	},
	filetypes = { "qml" },
	root_dir = require("lspconfig.util").root_pattern("qmlls.ini", ".git", "."),
	-- root_dir = find_root,
	single_file_support = true,
	settings = {
		qmlls = {
			completion = { enable = true, completeEnums = true },
			diagnostics = { enable = true },
			format = { enable = true, indentSize = 4 },
		},
	},
	on_new_config = function(new_config)
		new_config.cmd_env = vim.tbl_extend("force", new_config.cmd_env or {}, {
			QML2_IMPORT_PATH = qt_import_path,
		})
	end,
}
