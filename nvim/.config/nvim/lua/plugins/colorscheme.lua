-- return {
-- 	"AetherSyscall/AetherAmethyst.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("aetheramethyst").setup({
-- 			transparent = false, -- Enable transparent background
-- 			styles = {
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = { bold = true },
-- 				variables = {},
-- 			},
-- 		})
--
-- 		-- Load the variant: 'eclipse' (dark) or 'bliss' (light)
-- 		vim.cmd("colorscheme aetheramethyst-eclipse")
-- 	end,
-- }

return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			styles = {
				sidebars = "transparent",
				floats = "transparent",
				comments = { italic = false }, -- Disable italics in comments
			},
		})

		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme("tokyonight-moon")
	end,
}
