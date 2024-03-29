return {
	"neovim/nvim-lspconfig",
	config = function()
		require("nvchad.configs.lspconfig")
		-- require("lsp")
		require("lsp.django")
		require("lsp.pyright")
		require("lsp.eslint")
		require("lsp.tsserver")
		require("lsp.lua_ls")
		require("lsp.bash")
		require("lsp.css")
		require("lsp.yaml")
		require("lsp.html")
		require("lsp.kotlin")
		require("lsp.vim")
		require("lsp.cairo")
	end,
}
