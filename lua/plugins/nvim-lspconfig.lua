return {
	"neovim/nvim-lspconfig",
	config = function()
		require("nvchad.configs.lspconfig")
		require("lsp.django")
		require("lsp.pyright")
		require("lsp.eslint")
		require("lsp.tsserver")
	end,
}
