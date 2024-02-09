return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    local function reduce_color_strength(color)
      -- Reduce the color intensity by multiplying each channel value by a factor
      local reduced_color = "#" .. color:sub(2):gsub("%x%x", function(c)
        local value = tonumber(c, 16)
        local reduced_value = math.floor(value * 0.4)
        return string.format("%02x", reduced_value)
      end)

      return reduced_color
    end -- Retrieve original foreground colors
    local string_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("String")), "fg", "gui")
    local function_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Function")), "fg", "gui")
    local keyword_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Keyword")), "fg", "gui")
    local type_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Type")), "fg", "gui")
    local constant_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Constant")), "fg", "gui")
    local error_fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Error")), "fg", "gui")

    -- Reduce color strength
    local reduced_string_fg = reduce_color_strength(string_fg)
    local reduced_function_fg = reduce_color_strength(function_fg)
    local reduced_keyword_fg = reduce_color_strength(keyword_fg)
    local reduced_type_fg = reduce_color_strength(type_fg)
    local reduced_constant_fg = reduce_color_strength(constant_fg)
    local reduced_error_fg = reduce_color_strength(error_fg)

    -- Apply reduced colors to your configuration
    local colors = {
      { fg = reduced_string_fg },
      { fg = reduced_function_fg },
      { fg = reduced_keyword_fg },
      { fg = reduced_type_fg },
      { fg = reduced_constant_fg },
      { fg = reduced_error_fg }
    }
    require("hlchunk").setup({
      chunk = {
        enable = true,
        notify = true,
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#806d9c" },
          { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
      },

      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
          "│",
          "│",
          "│",
          "│",
          "│",
        },
        style = colors,
      },

      line_num = {
        enable = true,
        use_treesitter = false,
        style = "#806d9c",
      },

      blank = {
        enable = false,
        chars = {
          "․",
        },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
        },
      },
    })
  end
}
