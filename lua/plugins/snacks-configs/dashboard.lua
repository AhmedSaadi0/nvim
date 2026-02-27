return {
	enabled = true,
	width = 60,
	row = nil,
	col = nil,
	pane_gap = 4,
	preset = {
		keys = {
			{
				icon = " ",
				key = "f",
				desc = "Find File",
				action = ":lua Snacks.dashboard.pick('files')",
			},
			{
				icon = " ",
				key = "n",
				desc = "New File",
				action = ":ene | startinsert",
			},
			{
				icon = " ",
				key = "g",
				desc = "Find Text",
				action = ":lua Snacks.dashboard.pick('live_grep')",
			},
			{
				icon = " ",
				key = "r",
				desc = "Recent Files",
				action = ":lua Snacks.dashboard.pick('oldfiles')",
			},
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{
				icon = " ",
				key = "s",
				desc = "Restore Session",
				action = ":lua require('persistence').load()",
			},
			{
				icon = "󰒲 ",
				key = "L",
				desc = "Lazy",
				action = ":Lazy",
				enabled = package.loaded.lazy ~= nil,
			},
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		},
		header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	},
	formats = {
		icon = function(item)
			if item.file and item.icon == "file" or item.icon == "directory" then
				return Snacks.dashboard.icon(item.file, item.icon)
			end
			return { item.icon, width = 2, hl = "icon" }
		end,
	},
	sections = {
		-- القسم الأيسر
		{ section = "header" },
		{ section = "keys", gap = 1, padding = 1 },
		{ section = "startup" },

		-- القسم الأيمن
		{
			pane = 2,
			section = "terminal",
			-- تنبيه: إذا ظهر لك خطأ في المربع الملون، قم بمسح السطرين التاليين أو تعليقهما
			cmd = "bash colorscript -e square",
			height = 5,
			padding = 1,
		},
		{
			pane = 2,
			icon = " ",
			title = "Recent Files",
			section = "recent_files",
			indent = 2,
			padding = 1,
		},
		{
			pane = 2,
			icon = " ",
			title = "Projects",
			section = "projects",
			indent = 2,
			padding = 1,
		},
		{
			pane = 2,
			icon = " ",
			title = "Git Status",
			section = "terminal",
			enabled = function()
				return Snacks.git.get_root() ~= nil
			end,
			cmd = "git status --short --branch --renames",
			height = 5,
			padding = 1,
			ttl = 5 * 60,
			indent = 3,
		},
	},
}
