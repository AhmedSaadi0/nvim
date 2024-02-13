local mason_config = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "black",
      "debugpy",
      "mypy",
      -- "isort",
      -- "flake8",
      -- "pylint",
      "ruff",
      "pyright",
      "eslint-lsp",
      "js-debug-adapter",
      "prettier",
      "typescript-language-server",
      "html-lsp",
      "css-lsp",
      "djlint",
      "stylua",
    },
  },
}

return mason_config
