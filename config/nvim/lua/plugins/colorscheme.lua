-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
	"shaunsingh/nord.nvim",
	lazy = false, -- Load immediately during startup
	priority = 1000, -- Load before other plugins
	config = function()
		-- Optional: Configure nord.nvim settings
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require("nord").set()
	end,
}
