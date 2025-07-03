return {
	"akinsho/git-conflict.nvim",
	version = "*",
	event = "BufReadPost", -- يُحمّل بعد قراءة ملف (أفضل وقت لاكتشاف تعارضات)
	config = true,
}
