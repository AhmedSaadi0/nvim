local settings = {
  "kyazdani42/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 50, -- Set your desired default width here
      },
    })
  end,
}

return settings
