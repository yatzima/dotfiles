-- ~/.config/nvim/lua/plugins/alpha.lua

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { 
	"nvim-tree/nvim-web-devicons",
	"MaximilianLloyd/ascii.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    -- dashboard.section.header.val = require("ascii").art.text.neovim.sharp
    -- Get random Neovim ASCII art
    dashboard.section.header.val = require("ascii").get_random("text", "neovim")
    -- dashboard.section.header.val = require("ascii").art.misc.hydra.hydra
    -- Optional: Add a random header on each startup
    -- dashboard.section.header.val = require("ascii").get_random_global()

    -- Get current weekday
    local weekday = os.date("%A, %B %d")
    local weekday_text = " " .. weekday .. " "
    
    -- Add weekday below the ASCII art
    local header = dashboard.section.header.val
    table.insert(header, "")
    table.insert(header, "                  " .. weekday_text .. "                  ")
    table.insert(header, "")
    dashboard.section.header.val = header

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Set footer
    local function footer()
      local total_plugins = require("lazy").stats().count
      local datetime = os.date("%d-%m-%Y  %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

      return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
