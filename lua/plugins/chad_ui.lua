return {
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	{ "nvchad/volt", lazy = true },
	{ "nvchad/menu", lazy = true },
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
