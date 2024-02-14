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
      "eslint-lsp",
      "js-debug-adapter",
      "prettier",
      "typescript-language-server",
      "html-lsp",
      "css-lsp",
      "djlint",
      "pyright",
      "pylint",
      "eslint_d",
      "stylua",
      -- "djls",
    },
  },
}

return mason_config
