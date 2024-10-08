return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		local neovimAscii = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		local myNameAscii = {
			"                                                                                                      ",
			"	 █████╗ ██╗  ██╗███╗   ███╗███████╗██████╗      █████╗ ██╗     ███████╗ █████╗  █████╗ ██████╗ ██╗ ",
			"	██╔══██╗██║  ██║████╗ ████║██╔════╝██╔══██╗    ██╔══██╗██║     ██╔════╝██╔══██╗██╔══██╗██╔══██╗██║ ",
			"	███████║███████║██╔████╔██║█████╗  ██║  ██║    ███████║██║     ███████╗███████║███████║██║  ██║██║ ",
			"	██╔══██║██╔══██║██║╚██╔╝██║██╔══╝  ██║  ██║    ██╔══██║██║     ╚════██║██╔══██║██╔══██║██║  ██║██║ ",
			"	██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██████╔╝    ██║  ██║███████╗███████║██║  ██║██║  ██║██████╔╝██║ ",
			"	╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═════╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝ ",
			"																								       ",
		}

		local heartAscii = {
			"_____________________________________",
			"______888888888______________________",
			"_____888888888888888_________________",
			"___888888822222228888________________",
			"__88888822222222288888_______________",
			"_888888222222222228888822228888______",
			"_888882222222222222288222222222888___",
			"_8888822222222222222222222222222288__",
			"__8888822222222222222222222222222_88_",
			"___88888222222222222222222222222__888",
			"____888822222222222222222222222___888",
			"_____8888222222222222222222222____888",
			"______8888222222222222222222_____888_",
			"_______8882222222222222222_____8888__",
			"________888822222222222______888888__",
			"_________8888882222______88888888____",
			"__________888888_____888888888_______",
			"___________88888888888888____________",
			"____________8888888888_______________",
			"_____________8888888_________________",
			"______________88888__________________",
			"_______________888___________________",
			"________________8____________________",
			"_____________________________________",
		}

		local nvChadAscii = {
			"           ▄ ▄                   ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		}

		local cat = {
			"     ⠀⠀⣠⣤⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡴⠖⠶⡄    ",
			"     ⠀⠀⣿⠀⠉⠪⠷⣆⣀⣀⣀⣀⣠⣤⠤⡴⠏⣜⠀⠀⣿⠀⠀  ",
			"     ⠀⠀⢿⠀⠀⠀⠘⡄⠀⠉⠈⠀⠀⠀⠀⠀⠀⣀⣉⢢⣿⠀⠀  ",
			"     ⠀⠀⠈⣧⠀⠀⠀⡰⠀⠀⠴⠿⠷⠄⠀⠀⠈⠛⠛⠀⢯⡀⠀  ",
			"     ⠀⠀⠀⠹⡖⠢⠔⠁⠀⠀⠀⠀⢠⣀⣀⣙⣿⣇⣀⠄⠀⢻⡄  ",
			"     ⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⣸⠃  ",
			"     ⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠀  ",
			"     ⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠀  ",
			"     ⠀⠀⠀⠀⣰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀  ",
			"     ⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀  ",
			"     ⠀⠀⣴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀   ",
			"     ⠀⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇   ",
			"     ⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⡇   ",
		}

		local amongus = {
			" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠛⠉⠙⠛⠛⠛⠛⠻⢿⣿⣷⣤⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⠀⣼⣿⠋⠀ ⠀⠀⠀⠀⠀⠀⢀⣀⠈⢻⣿⣿⡄⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⣸⣿⡏⠀⠀ ⠀⣠⣶⣾⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⣄⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀ ⢰⣿⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣷⡄       ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌─┐┌─┐┌┐┌┌─┐┬ ┬  ┌┬┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐",
			" ⠀⣀⣤⣴⣶⣶⣿⡟⠀⠀⠀ ⢸⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷       └─┐│ │ │││ │  ├┤ │││├┤ ├┬┘│ ┬├┤ ││││  └┬┘  │││├┤ ├┤  │ │││││ ┬⠀",
			" ⢰⣿⡟⠋⠉⣹⣿⡇⠀⠀⠀ ⠀⠹⣿⣿⣿⣿⣷⣦⣤⣤⣤⣶⣶⣶⣿⣿⣿       └─┘└─┘─┴┘└─┘  └─┘┴ ┴└─┘┴└─└─┘└─┘┘└┘└─┘ ┴   ┴ ┴└─┘└─┘ ┴ ┴┘└┘└─┘",
			" ⢸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀ ⠀⠀⠉⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀",
			" ⣸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠉⠻⠿⠿⠛⢻⣿⡇⠀⠀",
			" ⣿⣿⠁⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⣿⣧⠀⠀",
			" ⣿⣿⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⣿⣿⠀",
			" ⣿⣿⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⣿⣿⠀",
			" ⢿⣿⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇",
			" ⠸⣿⣧⡀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀",
			" ⠀⠛⢿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣰⣿⣿⣷⣶⣶⣶⣶⠶⠀⢠⣿⣿⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⣽⣿⡏⠁⠀⠀⢸⣿⡇⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⢹⣿⡆⠀⠀⠀⣸⣿⠇⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⢿⣿⣦⣄⣀⣠⣴⣿⣿⠁⠀⠈⠻⣿⣿⣿⣿⡿⠏⠀⠀⠀⠀",
			"     ⠀⠀⠈⠛⠻⠿⠿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		}

		local sitama = {
			" ⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⡋⠉⠙⠒⢤⡀⠀⠀⠀ ⠀⠀⢠⠖⠉⠉⠙⠢⡄⠀",
			" ⠀⠀⠀⠀⠀⠀⢀⣼⣟⡒⠒⠀⠀⠀⠀⠀⠙⣆⠀⠀ ⠀⢠⠃⠀⠀⠀⠀⠀⠹⡄",
			" ⠀⠀⠀⠀⠀⠀⣼⠷⠖⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀ ⠀⡇⠀⠀⠀⠀⠀⠀⠀⢷",
			" ⠀⠀⠀⠀⠀⠀⣷⡒⠀⠀⢐⣒⣒⡒⠀⣐⣒⣒⣧⠀ ⠀⡇⠀⢠⢤⢠⡠⠀⠀⢸",
			" ⠀⠀⠀⠀⠀⢰⣛⣟⣂⠀⠘⠤⠬⠃⠰⠑⠥⠊⣿⠀ ⢴⠃⠀⠘⠚⠘⠑⠐⠀⢸",
			" ⠀⠀⠀⠀⠀⢸⣿⡿⠤⠀⠀⠀⠀⠀⢀⡆⠀⠀⣿⠀ ⠀⡇⠀⠀⠀⠀⠀⠀⠀⣸",
			" ⠀⠀⠀⠀⠀⠈⠿⣯⡭⠀⠀⠀⠀⢀⣀⠀⠀⠀⡟⠀ ⠀⢸⠀⠀⠀⠀⠀⠀⢠⠏",
			" ⠀⠀⠀⠀⠀⠀⠀⠈⢯⡥⠄⠀⠀⠀⠀⠀⠀⡼⠁⠀ ⠀⠀⠳⢄⣀⣀⣀⡴⠃⠀",
			" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡦⣄⣀⣀⣀⣠⠞⠁⠀⠀ ⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠛⠃⠀⠀⠀⢹⠳⡶⣤⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⣠⢴⣿⣿⣿⡟⡷⢄⣀⣀⣀⡼⠳⡹⣿⣷⠞⣳⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⢰⡯⠭⠹⡟⠿⠧⠷⣄⣀⣟⠛⣦⠔⠋⠛⠛⠋⠙⡆⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⢸⣿⠭⠉⠀⢠⣤⠀⠀⠀⠘⡷⣵⢻⠀⠀⠀⠀⣼⠀⣇⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⡇⣿⠍⠁⠀⢸⣗⠂⠀⠀⠀⣧⣿⣼⠀⠀⠀⠀⣯⠀⢸⠀⠀⠀",
		}

		local batman = {
			"               *         *      *         *",
			"           ***          **********          ***",
			"        *****           **********           *****",
			"      *******           **********           *******",
			"    **********         ************         **********           ╦  ┌─┐┌┬┐  ┬  ┬┌─┐┌┐┌┌─┐┌─┐┌─┐┌┐┌┌─┐┌─┐",
			"   ****************************************************          ║  ├─┤│││  └┐┌┘├┤ ││││ ┬├┤ ├─┤││││  ├┤",
			"  ******************************************************         ╩  ┴ ┴┴ ┴   └┘ └─┘┘└┘└─┘└─┘┴ ┴┘└┘└─┘└─┘o",
			" ********************************************************        ╦  ┌─┐┌┬┐  ┌┬┐┬ ┬┌─┐  ┌┐┌┬┌─┐┬ ┬┌┬┐",
			" ********************************************************        ║  ├─┤│││   │ ├─┤├┤   │││││ ┬├─┤ │",
			" ********************************************************        ╩  ┴ ┴┴ ┴   ┴ ┴ ┴└─┘  ┘└┘┴└─┘┴ ┴ ┴o",
			"  ******************************************************         ╦  ┌─┐┌┬┐  ╔╗ ┌─┐┌┬┐┌┬┐┌─┐┌┐┌",
			"   ********      ************************      ********          ║  ├─┤│││  ╠╩╗├─┤ │ │││├─┤│││",
			"    *******       *     *********      *       *******           ╩  ┴ ┴┴ ┴  ╚═╝┴ ┴ ┴ ┴ ┴┴ ┴┘└┘o",
			"      ******             *******              ******",
			"        *****             *****              *****",
			"           ***             ***              ***",
			"             **             *              **",
		}

		local nyaa = {
			" ⠀⠀⠀⠀⢸⣿⠛⠲⠦⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢋⣤⣂⣀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⣰⠃⠀⢀⣀⡀⠈⠛⠦⣀⠀⠀⢀⣀⡤⠤⠀⠀⠐⠈⠛⠛⠛⠒⠺⠧⢾⣉⠉⠶⣏⠈⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⡿⠀⢀⣴⡋⠉⠓⣄⠀⠈⠓⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠪⣝⡛⢥⡀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⢰⡇⠀⢀⣼⣛⣠⠴⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⠉⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⢸⡇⠀⠈⣹⠋⠁⢠⡇⠂⠀⠀⠀⠀⠰⣤⡀⠀⠀⠀⠀⠀⠀⠀⣀⡄⠀⠀⠀⠀⠀⠈⠂⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⣧⢀⡞⠁⠲⠚⠁⠀⠀⠀⣰⢿⠈⣇⢿⠱⣄⠠⠔⡒⠀⠉⠁⠀⠱⡀⠀⠀⠀⢀⠄⠀⠑⢦⡹⡙⣆⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠹⡾⠀⠀⠀⠀⠀⠀⣠⠞⢁⡟⠀⡿⡞⡆⠘⢦⠀⢸⡀⠀⠀⠀⠀⢷⣆⢀⡴⣿⡀⠀⠀⠀⠁⢳⡘⣆⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⢀⠴⠁⠀⣸⠧⣰⡇⣇⡇⠀⠘⣇⠈⣇⠀⠀⠀⠀⣿⣿⡇⠀⡿⣧⢢⠀⠀⠀⠈⢧⢹⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⡿⠀⠀⠀⠀⢰⠇⠀⠀⣠⠏⠀⡼⢳⣿⡀⠀⠀⠸⣾⢿⡄⣀⣀⣴⢏⣽⣧⣴⣃⢸⡞⠀⠀⠀⠀⢸⣼⠃⠀⠀⠀",
			" ⠀⠀⠀⢀⡇⠀⠀⠀⠀⣼⠀⠀⣰⠏⣠⣞⣥⡿⠷⠮⣇⠀⠀⠟⠀⠛⠁⠈⢿⢟⢵⡶⢮⡙⢿⣷⠀⠀⠀⠀⣼⡿⠀⠀⠀⠀",
			" ⠀⠀⠀⠐⡇⠀⠀⠀⣰⠃⢀⡼⡿⢛⣿⠟⣱⢶⡟⠙⣶⡀⠀⠀⠀⠀⠀⠀⠀⣿⢼⡇⠈⢳⠀⢻⡄⠀⠀⣰⠇⠁⠀⠀⠀⠀",
			" ⠀⠀⠀⢸⡇⠀⠀⣰⣣⢶⠋⢸⠁⣿⠃⢠⡷⠊⠀⢀⠘⢿⠀⠀⠀⠀⠀⠀⠀⣿⡈⠳⠃⢸⠃⠀⣧⠀⠈⠓⠦⡀⠀⠀⠀⠀",
			" ⠀⠀⠀⢸⠃⠀⠀⠉⠀⢸⡀⠿⠛⣏⠀⠈⣷⠀⠙⠉⢀⡾⠀⠀⠀⠀⠀⠀⠀⠈⠳⠤⠴⠋⣀⣀⡈⢳⡀⠀⠀⢹⡄⠀⠀⠀",
			" ⠀⠀⠀⣸⠆⠀⠀⠀⠀⠈⣇⠀⠀⠈⢧⠀⣈⡛⡒⡚⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⢣⣿⣿⣹⠀⢳⠀⠀⢸⡇⠀⠀⠀",
			" ⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢸⣞⡟⡴⡿⡽⠁⣲⣤⡤⠤⠖⠚⠛⠓⠒⢾⢿⡇⠃⠉⠑⠃⠀⣼⠃⠀⢸⡀⠀⢰⠀       ┌┐┌┬ ┬┌─┐┌─┐",
			" ⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⢸⠋⠘⠀⠁⠀⢠⡇⠈⠀⠀⠀⠀⠀⠀⠀⠉⣾⠀⠀⠀⠀⠀⣰⠃⠀⣀⠈⠓⣶⡿⠀       │││└┬┘├─┤├─┤",
			" ⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠠⡄⠸⣆⣀⣠⠄⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⣰⠇⠀⠀⢀⣠⠞⠁⠀⠀⠉⢋⡿⠉⠀⠀       ┘└┘ ┴ ┴ ┴┴ ┴",
			" ⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢳⡀⠀⡉⠒⣮⣽⣋⠀⠀⠀⠘⢦⣀⡀⠀⢀⣀⣤⠞⢁⣀⣤⠔⠋⠁⠀⢀⣀⣠⠶⡏⠀⠀⠀⠀",
			" ⠀⢷⠀⠀⣀⠀⠀⠀⠀⠀⠀⠳⢤⣈⣙⣫⣭⣿⣽⠶⣦⣀⢀⣈⢉⣿⠿⣷⢶⣯⣍⠀⠀⠀⠀⠀⠀⡸⠃⠁⢸⠇⠀⠀⠀⠀",
			" ⠀⠈⠀⠀⠈⠲⠤⢄⡀⡀⠀⠀⠀⠀⣴⠏⠁⠀⢷⠀⢿⢿⣿⣾⣿⣧⠀⠈⢳⡀⠙⣧⣀⣀⣠⠴⠋⠀⠀⠀⣸⠀⠀⠀⠀⠀",
			" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠉⠙⢒⡾⣏⣀⠀⠀⠘⡆⢼⣿⢋⠹⣿⣿⠀⠀⠀⣷⣠⠼⠙⢇⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠀",
		}

		local hys = {
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠜⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿",
			"⣿⣿⡏⠁⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣦⣤⡄⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿",
			"⣿⣿⣷⣄⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡧⠇⢀⣤⣶⣿⣿⣿⣿⣿⣿      ┌─┐┌─┐┬ ┬  ┌┬┐┬ ┬  ┌┐┌┌─┐┌┬┐┌─┐",
			"⣿⣿⣿⣿⣿⣿⣾⣮⣭⣿⡻⣽⣒⠀⣤⣜⣭⠐⢐⣒⠢⢰⢸⣿⣿⣿⣿⣿⣿⣿⣿      └─┐├─┤└┬┘  │││└┬┘  │││├─┤│││├┤ ",
			"⣿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⡟⣾⣿⠂⢈⢿⣷⣞⣸⣿⣿⣿⣿⣿⣿⣿⣿      └─┘┴ ┴ ┴   ┴ ┴ ┴   ┘└┘┴ ┴┴ ┴└─┘",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣷⣶⣾⡿⠿⣿⠗⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⠋⠉⠑⠀⠀⢘⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⡿⠟⢹⣿⣿⡇⢀⣶⣶⠴⠶⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⡿⠀⠀⢸⣿⣿⠀⠀⠣⠀⠀⠀⠀⠀⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠹⣿⣧⣀⠀⠀⠀⠀⡀⣴⠁⢘⡙⢿⣿⣿⣿⣿⣿⣿⣿",
			"⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⠗⠂⠄⠀⣴⡟⠀⠀⡃⠀⠉⠉⠟⡿⣿⣿⣿",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠾⠛⠂⢹⠀⠀⠀⢡⠀⠀⠀⠀⠀⠙⠛⠿",
		}

		local cat2 = {
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⣠⣴⣿⣿⣆⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢁⣠⣾⣿⣿⣿⣿⣿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⢀⣤",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⢀⣴⣾⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠉⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠀⠀⣀⣀⠉⠉⠙⠛⠋⠀⣠⣾⣿⣿⣿⡿⢃",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢠⣀⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⣡⣾⢋⣴⣿⣿⡿⢋⣴⡷⢀⣤⣾⣿⣿⣿⣿⡿⣱⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣴⣿⢣⣿⣿⣿⠟⣴⣿⡟⣡⣿⣿⣿⣿⣿⣿⣿⣃⣛⢻",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠻⢃⣾⣿⣿⡏⣼⣿⠟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣫⣾",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⡀⠀⣠⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣧⣈⣋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡙",
			" ⣿⣿⣿⣿⣿⠏⢠⣤⡀⠉⠛⠃⢸⣿⣷⣿⣿⣿⣿⡟⠁⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⡿⠋⢉⣀⣀⣿⣿⣧⣀⠀⠀⠈⠙⢿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣸⣿⠿⢛⣛⣛⣛⣛⠿⢿⣿⣿⣿⣿⡿⠉⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿      ┌─┐┬  ┌─┐┌─┐┌─┐  ┌┬┐┌─┐",
			" ⠋⢀⣴⣿⣿⣿⣿⣿⣿⣿⣦⡙⠶⣄⡀⠈⠙⠿⣿⣧⣄⣀⣠⣴⢟⡁⣾⣿⣿⣿⣿⣿⣿⣷⣯⣻⣿⣿⡇⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿      │  │  │ │└─┐├┤   │││├┤ ",
			" ⠀⢸⣿⡿⢁⡄⠀⠈⢿⣿⣿⡏⣳⠮⣙⠳⣤⣀⠈⠙⠿⣿⣿⡏⣾⣧⠻⣿⡿⣉⢿⣿⣿⡿⢻⣷⢹⣿⣧⡀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿      └─┘┴─┘└─┘└─┘└─┘  ┴ ┴└─┘",
			" ⠀⣼⣿⡇⠸⠀⠀⠀⢸⣿⣿⡇⣿⣷⣦⣅⡂⠙⠳⢦⣄⠈⠙⠻⣿⣿⣿⣶⣿⣿⣦⣭⣭⣶⣿⣿⡎⣿⣿⣿⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿",
			" ⠀⣿⣿⣿⣦⣀⣀⣴⣿⣿⣿⡇⣿⣿⣿⣿⣿⣷⣦⣽⣿⣿⠀⣄⠀⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⠀⢻⣿⣿⣿⡿⠻⣿⡿⢛⣭⣅⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡆⣶⢀⡀⠙⠛⠉⠉⠙⠛⢯⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⠀⢸⣿⠙⢿⣧⣤⡿⢃⣿⣿⡟⣿⣷⢨⠙⠻⢿⣿⣿⣿⣿⠀⣿⡇⣿⢸⡇⢰⡆⣀⠻⢶⣤⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⠀⠘⠿⣿⣶⣬⣥⣶⣿⠟⠛⠛⠿⣿⢸⠸⡇⣶⢨⣙⡻⠿⡄⠙⠃⢿⢸⡇⣿⡇⣿⠀⡶⣭⣁⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⡄⠀⠳⢦⣍⡛⠋⣉⣥⣘⠳⢤⣀⠀⠈⠈⠇⣿⢸⣿⣿⣷⣦⣅⠢⢄⡀⠁⠙⠇⣿⠀⣿⣶⣿⣇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⣷⣦⣄⡀⠉⠓⠦⠉⠛⠷⣦⣌⡛⠶⢤⣀⠈⠈⠻⢿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠈⠀⣿⣿⣿⣿⡀⢸⣿⣿⣿⣿⣟⢿⣿⣿⣿⡿⠿⠛",
			" ⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠘⠻⠿⢷⣦⣌⡙⠲⣤⡀⠈⠙⠻⣿⣿⣿⣿⣿⣷⣦⣄⡛⢿⣿⣿⡇⢸⣯⡙⢿⣿⡿⢳⣍⠻⠟⢃⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⣠⣤⣤⣤⣈⡉⠳⠦⢉⣓⣈⣡⣤⣌⣉⣉⠙⠛⠿⣿⣿⣶⣬⠉⠁⠀⣿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢸⣿⣿⣿⣿⣿⣿⠀⣴⣿⣿⣿⠟⣫⣾⣿⣿⣿⣶⣄⡈⠙⢿⡿⠀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⡿⣣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣀⣿⣿⣿⣿⣿⣿⣿⣄⣙⣟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣑⣛⣷⣄⣈⣛⣛⣛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿",
		}

		local asciiArts = {
			neovimAscii,
			myNameAscii,
			heartAscii,
			nvChadAscii,
			cat,
			amongus,
			sitama,
			batman,
			nyaa,
			hys,
			cat2,
		}

		-- Select a random ASCII art
		math.randomseed(os.time())
		local header = asciiArts[math.random(#asciiArts)]

		-- Set header
		dashboard.section.header.val = header

		-- dashboard.section.header.val = nvChadAscii

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC n", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
