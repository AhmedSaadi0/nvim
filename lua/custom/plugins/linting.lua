return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      -- python = { "pylint" },
      htmldjango = { "djlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- vim.keymap.set("n", "<leader>l", function()
    --   lint.try_lint()
    -- end, { desc = "Trigger linting for current file" })
    --
    -- lint.linters.pylint.cmd = ".venv/bin/python"
    -- lint.linters.pylint.args = {
    --   "pylint",
    --   "--disable=c0111,c0302,line-too-long",
    --   "--enable=w0614",
    --   "--load-plugins=pylint_celery,pylint_django",
    --   "--django-settings-module=hopofy.settings",
    -- }
    -- require("lint").linters.pylint.cmd = "python"
    -- require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }
    -- lint.linters.pylint = {
    --   cmd = ".venv/bin/pylint",
    --   args = {
    --     "--disable=C0111,C0302",
    --     "--enable=W0614",
    --     "--load-plugins=pylint_celery,pylint_django",
    --     "--django-settings-module=hopofy.settings",
    --   },
    --   stdin = true,
    --   stream = "stdout",
    --   parser = require("lint.parser").from_errorformat({
    --     "%f:%l:%c: %trror: %m",
    --     "%f:%l:%c: %tarning: %m",
    --     "%f:%l:%c: %tote: %m",
    --   }),
    -- }
  end,
}
