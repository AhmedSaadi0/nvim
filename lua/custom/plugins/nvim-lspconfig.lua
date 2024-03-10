return {
	"neovim/nvim-lspconfig",
	config = function()
		require("plugins.configs.lspconfig")
		require("custom.lsp.django")
		require("custom.lsp.pyright")
		require("custom.lsp.eslint")
	end,
}
