return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function(_, opts)
    local path = "/media/linux/projects/hopofy/stable/.venv/bin/python"
    -- require "custom.configs.dap"
    require("dap-python").setup(path)
    require("core.utils").load_mappings("dap_python")
  end,
}
