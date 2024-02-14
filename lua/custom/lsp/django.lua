-- local config = require("plugins.configs.lspconfig")

-- local on_attach = config.on_attach
-- local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        autopep8 = {
          enabled = false,
        },
        pylint = {
          enabled = true,
          executable = "pylint",
          args = {
            "--disable=C0111,C0302",
            "--enable=W0614",
            "--load-plugins=pylint_celery,pylint_django",
            "--django-settings-module=hopofy.settings",
          },
        },
      },
    },
  },
})
