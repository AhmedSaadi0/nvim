-- dressing.lua
return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		select = {
			-- اجعل Telescope هو الخيار الأول لعرض القوائم
			backend = { "telescope", "builtin" },
		},
	},
}
