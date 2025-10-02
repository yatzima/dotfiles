-- ~/.config/nvim/lua/plugins/which-key.lua

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      win = {
        border = "rounded",
        padding = { 1, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
      },
    })

    -- Register group names (this helps organize the which-key display)
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>c", group = "Code" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "UI" },
      { "<leader>w", group = "Window" },
      { "<leader>x", group = "Diagnostics/Quickfix" },
      { "<leader>b", group = "Buffer" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
      { "g", group = "Goto" },
      { "z", group = "Fold" },
    })
  end,
}
