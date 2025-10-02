-- Plugin manager setup and plugin specifications

require("lazy").setup({
  -- Import all plugin specs from lua/plugins/*.lua
  { import = "plugins.colorscheme" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.which-key" },
  { import = "plugins.alpha" },
  { import = "plugins.snacks" },
  -- { import = "plugins.lsp" },
}, {
  -- Lazy.nvim configuration options
  checker = {
    enabled = true,  -- Automatically check for plugin updates
    notify = false,  -- Don't notify on every update available
  },
  change_detection = {
    notify = false,  -- Don't notify when config files change
  },
})
