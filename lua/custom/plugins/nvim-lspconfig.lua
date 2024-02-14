return {
  "neovim/nvim-lspconfig",
  config = function()
    require("plugins.configs.lspconfig")
    require("custom.lsp.django")
  end,
}
