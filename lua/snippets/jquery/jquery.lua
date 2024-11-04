-- ~/.config/nvim/lua/snippets/jquery.lua
local ls = require("luasnip") -- Import luasnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- jQuery ready function
	s("jqready", {
		t({ "$(document).ready(function() {", "\t" }),
		i(1, "// code here"),
		t({ "", "});" }),
	}),

	-- jQuery click event
	s("jqclick", {
		t({ "$(", "" }),
		i(1, "'selector'"),
		t({ ").click(function() {", "\t" }),
		i(2, "// code here"),
		t({ "", "});" }),
	}),

	-- jQuery addClass function
	s("jqaddclass", {
		t({ "$(" }),
		i(1, "'selector'"),
		t({ ").addClass(" }),
		i(2, "'className'"),
		t({ ");" }),
	}),

	-- jQuery removeClass function
	s("jqremoveclass", {
		t({ "$(" }),
		i(1, "'selector'"),
		t({ ").removeClass(" }),
		i(2, "'className'"),
		t({ ");" }),
	}),
}
